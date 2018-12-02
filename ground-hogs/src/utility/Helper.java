package utility;

import java.text.DecimalFormat;

public class Helper {

	public Helper() {
		// TODO Auto-generated constructor stub
	}
	
	public static String getClassNameForRating(Double rating) {
		if(rating<=0) return "0_STAR";
		else if(rating<=0.5) return "0_5_STAR";
		else if(rating<=1) return "1_STAR";
		else if(rating<=1.5) return "1_5_STAR";
		else if(rating<=2) return "2_STAR";
		else if(rating<=2.5) return "2_5_STAR";
		else if(rating<=3) return "3_STAR";
		else if(rating<=3.5) return "3_5_STAR";
		else if(rating<=4) return "4_STAR";
		else if(rating<=4.5) return "4_5_STAR";
		else return "5_STAR";
	}
	
	public static String getFormattedAmount(Double amount) {
		DecimalFormat df = new DecimalFormat("0.00");
		return "$"+df.format(amount);
	}

}
