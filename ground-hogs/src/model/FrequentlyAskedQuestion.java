package model;

import java.util.regex.Pattern;

import database.DBAccess;


public class FrequentlyAskedQuestion {
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getVotes() {
		return votes;
	}
	public void setVotes(int votes) {
		this.votes = votes;
	}
	private int questionId;
	private String question;
	private String answer;
	private int votes;
	public int getQuestionId() {
		return questionId;
	}
	public FrequentlyAskedQuestion(int questionId, String question, String answer, int votes) {
		this.questionId=questionId;
		this.question=question;
		this.answer=answer;
		this.votes=votes;
	}
	public String getProcessedAnswerHtml() {
		String formattedAnswer=this.answer;
		Pattern pattern = Pattern.compile("productId=\\w+");
		java.util.regex.Matcher matcher = pattern.matcher(formattedAnswer);
		while (matcher.find())
		{
			formattedAnswer=formattedAnswer.replaceAll(matcher.group(),getHtmlFor(matcher.group()));
		}
		return formattedAnswer;
	}
	private String getHtmlFor(String group) {
		String product="Unknown Item";
		String[] str = group.split("=");
		int itemId=Integer.parseInt(str[1]);
		if(itemId>0) {
			SalesItem item= DBAccess.SP_GetSalesItem(itemId);
			product=item.createHtmlAnchor("");
		}
		return product;
	}
}
