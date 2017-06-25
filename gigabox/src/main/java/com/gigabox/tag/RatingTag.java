package com.gigabox.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class RatingTag extends TagSupport {

	
	private static final long serialVersionUID = -4219578713538424588L;
	
	private String rating;
	/*private static final String prefix = "<span class='label label-primary'>";
	private static final String suffix = "</span> ";*/
	
	@Override
	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().println(getRatingTag());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	private String getRatingTag() {
		if (rating == null || "".equals(rating.trim())) {
			return "";
		}
		
		String tag = "";
		
		if ("전체관람가".equals(rating)) {
			tag = "<span class='label label-success' style='border-radius: 50%;'>All</span>";
		} else if ("12세 관람가".equals(rating)) {
			tag = "<span class='label label-primary' style='border-radius: 50%; background-color: blue;'>12</span>";
		} else if ("15세 관람가".equals(rating)) {
			tag = "<span class='label label-warning' style='border-radius: 50%;'>15</span>";
		} else if ("청소년 관람불가".equals(rating)) {
			tag = "<span class='label label-danger' style='border-radius: 50%;'>19</span>";
		} else if ("미정".equals(rating)) {
			tag = "<span class='label label-default' style='border-radius: 50%;'>미정</span>";
		} 
		
		return tag;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}
}
