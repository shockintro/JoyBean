package njupt.action;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class bookAction extends ActionSupport{
	private static final long serialVersionUID = 2852498031633584929L;
	
	private String Text;
	public ArrayList<HashMap<String, String>> getList() {
		return list;
	}
	public void setList(ArrayList<HashMap<String, String>> list) {
		this.list = list;
	}
	public HashMap<String, String> getMap() {
		return map;
	}
	public void setMap(HashMap<String, String> map) {
		this.map = map;
	}
	private ArrayList<HashMap<String,String>> list=new ArrayList<HashMap<String,String>>();
	private HashMap<String,String> map=new HashMap<String,String>();
	private ArrayList<String> list1=new ArrayList<String>();
	public ArrayList<String> getList1() {
		return list1;
	}
	public void setList1(ArrayList<String> list1) {
		this.list1 = list1;
	}
	public String getText() {
		return Text;
	}
	public void setText(String text) {
		Text = text;
	}

	public String pluginAjax(){
		StringBuilder sb=new StringBuilder();
		sb.append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10));
		Text=sb.toString();
		return SUCCESS;
		
	}
	
	public String PersonalCenter(){
		map.put("id", "1");
		map.put("userName", "lhf");
		map.put("number", "12345678999");
		map.put("state", "ø…”√");
		map.put("date", "2017.01.06");
//		list1.add("123");
//		list1.toString();
		ActionContext.getContext().put("list", list1);
		
		return SUCCESS;
	}
	public static void main(String[] args) {
		StringBuilder sb=new StringBuilder();
		sb.append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10)).append((int)(Math.random()*10));
		System.out.println(sb.toString());
	}
}
