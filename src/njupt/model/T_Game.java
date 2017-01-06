package njupt.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class T_Game {
	private int id;
	private String game_name;
	private T_Game_Type game_type;  //游戏类型，多对一映射
	private int game_status;// 游戏状态 1：商用 2：下线
	private String game_detail;
	private String game_picture;
	private int charge_price;
	private int beans_price;
	private Date create_time;
	private Date modify_time;

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGame_name() {
		return game_name;
	}

	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public T_Game_Type getGame_type() {
		return game_type;
	}

	public void setGame_type(T_Game_Type game_type) {
		this.game_type = game_type;
	}

	public int getGame_status() {
		return game_status;
	}

	public void setGame_status(int game_status) {
		this.game_status = game_status;
	}

	public String getGame_detail() {
		return game_detail;
	}

	public void setGame_detail(String game_detail) {
		this.game_detail = game_detail;
	}

	public String getGame_picture() {
		return game_picture;
	}

	public void setGame_picture(String game_picture) {
		this.game_picture = game_picture;
	}

	public int getCharge_price() {
		return charge_price;
	}

	public void setCharge_price(int charge_price) {
		this.charge_price = charge_price;
	}

	public int getBeans_price() {
		return beans_price;
	}

	public void setBeans_price(int beans_price) {
		this.beans_price = beans_price;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getModify_time() {
		return modify_time;
	}

	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
	}

}
