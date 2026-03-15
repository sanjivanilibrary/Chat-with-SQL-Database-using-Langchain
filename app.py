
import os
import streamlit as st
from pathlib import Path
from langchain_community.utilities.sql_database import SQLDatabase
from langchain_community.callbacks.streamlit import StreamlitCallbackHandler
from langchain_community.agent_toolkits import SQLDatabaseToolkit, create_sql_agent
from sqlalchemy import create_engine
import sqlite3
from langchain_groq import ChatGroq
st.balloons()
st.set_page_config(page_title="Chat with SQL Database using Langchain", page_icon=":bar_chart:", layout="wide")

# Create two columns: left for title, right for name/date
col1, col2 = st.columns([6,2])

with col1:
    st.title("🐦 Chat with SQL Database using Langchain")

with col2:
    constant_date = "14 March 2026"   # fixed date
    st.markdown(
        "<span style='color:red; font-size:14px; font-weight:bold;'>Er. Shubham Bhagat</span>",
        unsafe_allow_html=True
    )
    st.markdown(
        f"<span style='color:red; font-size:12px;'>Developed on {constant_date}</span>",
        unsafe_allow_html=True
    )
injection_Warning="""⚠️ **Injection Warning**: Be cautious when allowing user 
input to interact with your database.Always validate and sanitize 
inputs to prevent SQL injection attacks. Consider implementing parameterized 
queries or using an ORM to enhance security.some LLMs may not be able to detect
all injection attempts, so it's crucial to implement robust 
security measures on the backend."""
LocalDB="USE_LOCAL_DB"
MYSQL="USE_MYSQL"
# Sidebar input for API key
api_key = st.sidebar.text_input("Enter your Groq API Key", type="password" )
    
raidio_opt=["Use SQLLite_DB-Student_DB","Connect to your SQL_DB"]
selected_option=st.sidebar.radio(label="Select Database Option", options=raidio_opt)
if raidio_opt.index(selected_option)==1:
    db_url=MYSQL
    my_sql_host=st.sidebar.text_input("MySQL Host",value="Localhost")
    my_sql_user=st.sidebar.text_input("MySQL User   name",value="root")
    my_sql_password=st.sidebar.text_input("MySQL Password",value="asdfgh",type="password")
    my_sql_db=st.sidebar.text_input("MySQL Database Name",value="school_ai_test")
else:
    db_url=LocalDB
    

if not db_url:
    st.info("Please select a database option from the sidebar.")
elif not api_key.strip():
    st.info("Please enter your Groq API Key in the sidebar.")
        ## LLM Model 
else:
    llm = ChatGroq(
        groq_api_key=api_key,
        model_name="llama-3.3-70b-versatile",
        streaming=True
        )
    st.write("Groq client initialized successfully!")

    @st.cache_resource(ttl=7200)
    def configure_db(db_url,my_sql_host=None,my_sql_user=None,my_sql_password=None,my_sql_db=None):
        if db_url==LocalDB:
            # Build absolute path to Student_DB.db
            #dbfilepath = Path(__file__).parent / "Student.db" # For local DB
            dbfilepath="student.db"
            if not os.path.exists(dbfilepath)
            #if not dbfilepath.exists():
                st.error(f"Database file not found at {dbfilepath}")
                st.stop()
            creator=lambda:sqlite3.connect(f"file:{dbfilepath}?mode=ro",uri=True)
            return SQLDatabase(create_engine("sqlite:///",creator=creator))
        elif db_url==MYSQL:
            if not all([my_sql_host,my_sql_user,my_sql_password,my_sql_db]):
                st.warning("Please fill in all MySQL connection details.")
                st.stop()
            return SQLDatabase(create_engine(f"mysql+mysqlconnector://{my_sql_user}:{my_sql_password}@{my_sql_host}/{my_sql_db}"))
    if(db_url==MYSQL):
        db=configure_db(db_url,my_sql_host,my_sql_user,my_sql_password,my_sql_db)
    else:
        db=configure_db(db_url)
    ##tool kit
    toolkit=SQLDatabaseToolkit(db=db,llm=llm)
    agent=create_sql_agent(
        llm=llm,
        toolkit=toolkit,
        verbose=True,
        agent_type="zero-shot-react-description"
    )
    if("messages"not in st.session_state or st.sidebar.button("Clear Conversation")):
        st.session_state["messages"]=[{"role":"assistant","content":"Hello! I'm your SQL assistant. Ask me anything about the database!"}]
        
    for message in st.session_state["messages"]:
        st.chat_message(message["role"]).write(message["content"])
    user_Query = st.chat_input("Ask a question about the database:", key="db_chat_input")
    if user_Query:
        st.session_state.messages.append({"role":"user","content":user_Query})
        st.chat_message("user").write(user_Query)
        with st.spinner("Generating response..."):
            streamlit_callback=StreamlitCallbackHandler(st.container())
            response=agent.run(user_Query,callbacks=[streamlit_callback])
            st.session_state.messages.append({"role":"assistant","content":response})   
            st.write(response)
