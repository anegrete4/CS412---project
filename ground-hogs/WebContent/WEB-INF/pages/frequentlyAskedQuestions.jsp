    
<%@ page import="java.util.*" %> 
<%@ page import="model.FrequentlyAskedQuestion" %>
<%@ page import="database.DBAccess" %>     
<%!ArrayList<FrequentlyAskedQuestion> faqs=new ArrayList<FrequentlyAskedQuestion>();%>
<% 	
	faqs=(ArrayList)DBAccess.SP_GetFAQ(0);
%>
  
<div class="Content-header" id="FAQContent">
<div id="best"><h1>Q & As</h1></div>
       <div class="faqArea invisibleScrollBg">
       		<ol>
       		<%
       			for(FrequentlyAskedQuestion q:faqs){
       				%>
       					<li class="faqRow">
       					  <div class="qaGroup">
       						<div class="question">Q:<strong><%=" "+q.getQuestion() %></strong></div>
       						<div class="answer">A:<%=" "+ q.getProcessedAnswerHtml()%></div>
       					  </div>
       					  <div class="voteGroup">
  						  	<div class="vote" id="vote<%=q.getQuestionId()%>"><%=q.getVotes() %></div>
  						  	<div class="upVote" onclick='upVoteMe("<%=q.getQuestionId()%>")'></div>
  						  </div>
       					</li>
       				<%
       			}
       		%>
       		</ol>
       </div>
          
</div>