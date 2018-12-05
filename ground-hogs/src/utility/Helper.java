package utility;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Helper {
	public static String[] customerSupportFormDataValidation = { "contactUsReason", "txtAreaMessage", "fname", "lname",
			"email", "phone" };
	public static String[] quickQuestionValidation = { "contactUsReason", "txtAreaMessage" };
	public static String[] workshopValidation = { "fname", "lname", "email" };
	public static String[] checkoutValidationWithoutBillingAddress = { "fname", "lname", "saddress", "city", "state",
			"zip", "email", "cname", "cardno", "expmonth", "expyear", "csv" };

	public static String[] checkOutValidationWithBillingAddress = { "fname", "lname", "saddress", "city", "state",
			"zip", "email", "cname", "cardno", "expmonth", "expyear", "csv", "baddress", "bcity", "bstate", "bzip" };
	private static List<String> validData;
	private static List<String> inValidData;
	private static HttpSession currentSession;
	public static String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
			+ "A-Z]{2,7}$";

	public static String phoneRegex = "\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}|\\(d{3}\\) d{3}-?d{4}";

	public Helper() {
		// TODO Auto-generated constructor stub
	}

	public static String getClassNameForRating(Double rating) {
		if (rating <= 0)
			return "0_STAR";
		else if (rating <= 0.5)
			return "0_5_STAR";
		else if (rating <= 1)
			return "1_STAR";
		else if (rating <= 1.5)
			return "1_5_STAR";
		else if (rating <= 2)
			return "2_STAR";
		else if (rating <= 2.5)
			return "2_5_STAR";
		else if (rating <= 3)
			return "3_STAR";
		else if (rating <= 3.5)
			return "3_5_STAR";
		else if (rating <= 4)
			return "4_STAR";
		else if (rating <= 4.5)
			return "4_5_STAR";
		else
			return "5_STAR";
	}

	public static String getFormattedAmount(Double amount) {
		DecimalFormat df = new DecimalFormat("0.00");
		return "$" + df.format(amount);
	}

	public static void setResponseInSession(HttpSession session, String popUpTitle, ArrayList<String> responses,
			String responseType, String popUpContent) {
		session.setAttribute("popUpTitle", popUpTitle);
		session.setAttribute("responses", responses);
		session.setAttribute("responseType", responseType);
		session.setAttribute("hasResponse", true);
		session.setAttribute("popUpContent", popUpContent);
	}

	public static boolean validateDataAndManageSession(HttpServletRequest request, String[] quickQuestionValidation2) {
		resetDataValidation(request);
		validData = new ArrayList<String>();
		inValidData = new ArrayList<String>();
		for (String s : quickQuestionValidation2) {
			request.getSession().removeAttribute(s);// clear if there exist anything in session that we might need in
													// future
			if (request.getParameter(s) != null) {
				if (request.getParameter(s).isEmpty()) {
					inValidData.add(s);
				} else {
					if ((s.equalsIgnoreCase("email") && !validateRegex(request, emailRegex, "email"))
							|| (s.equalsIgnoreCase("phone") && !validateRegex(request, phoneRegex, "phone"))) {
						inValidData.add(s);
					} else {
						validData.add(s);
					}
					request.getSession().setAttribute(s, request.getParameter(s));
				}
			}
		}
		if (!inValidData.isEmpty()) { // only populate the session if current data is invalid
			request.getSession().setAttribute("validData", validData);
			request.getSession().setAttribute("inValidData", inValidData);
		}
		return inValidData.isEmpty();
	}

	public static void resetDataValidation(HttpServletRequest request) {
		if (request.getSession().getAttribute("validData") != null) {
			validData = (List<String>) request.getSession().getAttribute("validData");
		}
		if (request.getSession().getAttribute("inValidData") != null) {
			request.getSession().removeAttribute("inValidData");
			if (inValidData != null)
				inValidData = null;
		}
		if (validData != null) {
			for (String s : validData) {
				request.getSession().removeAttribute(s);
			}
		}
		if (request.getSession().getAttribute("validData") != null) {
			request.getSession().removeAttribute("validData");
			if (validData != null)
				validData = null;
		}
	}

	public static void initializeSessionDataForValidation(HttpServletRequest request) {
		// resetDataValidation(request);
		validData = new ArrayList<String>();
		inValidData = new ArrayList<String>();
		if (request.getSession().getAttribute("validData") != null) {
			validData = (List<String>) request.getSession().getAttribute("validData");
		}
		if (request.getSession().getAttribute("inValidData") != null) {
			inValidData = (List<String>) request.getSession().getAttribute("inValidData");
		}
		currentSession = request.getSession();

	}

	public static String validate(String field) {
		String error = "";
		if (inValidData.contains(field)) {
			error = "error";
		}
		return error;
	}

	public static int getStoredInt(String field) {
		int val = 0;
		if (validData.contains(field)) {
			val = Integer.parseInt((String) currentSession.getAttribute(field));
		}
		return val;
	}

	public static String getStoredString(String field) {
		String val = "";
		if (currentSession.getAttribute(field) != null) {
			val = (String) currentSession.getAttribute(field);
		}
		return val;
	}

	public static String isChecked(String field) {
		String val = "";
		if (currentSession.getAttribute(field) != null) {
			if (val.equalsIgnoreCase(field)) {
				val = "checked";
			}
		}
		return val;
	}

	public static boolean hasErrors() {
		return inValidData != null && !inValidData.isEmpty();
	}

	public static String getErrorClass() {
		return hasErrors() ? "error" : "";
	}

	private static boolean validateRegex(HttpServletRequest request, String regex, String field) {
		return request.getParameter(field).matches(regex);
	}

}
