package coreservlets;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import utility.Helper;

public class SubmitCheckout extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ArrayList<String> responses = new ArrayList<String>();
		boolean validationSuccess = false;
		boolean validateWithbillingAddress = request.getParameter("isSameBilling") == null;
		if (validateWithbillingAddress) {
			if (Helper.validateDataAndManageSession(request, Helper.checkOutValidationWithBillingAddress)) {
				validationSuccess = true;
				responses.add("Thank you for your business!");
			}

		} else {
			if (Helper.validateDataAndManageSession(request, Helper.checkoutValidationWithoutBillingAddress)) {
				validationSuccess = true;
				responses.add("Thank you for your business!");
			}

		}
		if (validationSuccess) {
			HttpSession session = request.getSession();
			session.setAttribute("custName", request.getParameter("fname") + " " + request.getParameter("lname"));
			session.setAttribute("custAddress",
					request.getParameter("saddress") + " " + request.getParameter("saddress2") != null
							? request.getParameter("saddress2")
							: "");
			session.setAttribute("cityStateZip", request.getParameter("city") + ", " + request.getParameter("state")
					+ "-" + request.getParameter("zip"));

			setResponseInSession(session, "Thank you!", responses, "success", "popUpShippingConfirmation");

			Helper.resetDataValidation(request);

		} else {
			setResponseInSession(request.getSession(), "Checkout", responses, "success", "popUpCheckout");
		}

		return (mapping.findForward("returnToLastPage"));
	}

	private void setResponseInSession(HttpSession session, String popUpTitle, ArrayList<String> responses,
			String responseType, String nextScreen) {
		session.setAttribute("popUpTitle", popUpTitle);
		session.setAttribute("responses", responses);
		session.setAttribute("responseType", responseType);
		session.setAttribute("hasResponse", true);
		session.setAttribute("popUpContent", nextScreen);
	}
}
