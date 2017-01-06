package njupt.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class T_Shopping_Record {
	private int id;
	private T_User user_id;// 购买用户
	private T_Game game_id;// 游戏ID
	private int buy_time;// 购买方式：1：乐豆购买，2：话费购买
	private Date create_time;// 创建时间/购买时间
	private int buy_price;// 消费的乐豆/话费额度
	private int present_beans;// 赠送的乐豆数量
	private int present_status;// 赠送状态，1：已赠送，2：未赠送

	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public T_User getUser_id() {
		return user_id;
	}

	public void setUser_id(T_User user_id) {
		this.user_id = user_id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	public T_Game getGame_id() {
		return game_id;
	}

	public void setGame_id(T_Game game_id) {
		this.game_id = game_id;
	}

	public int getBuy_time() {
		return buy_time;
	}

	public void setBuy_time(int buy_time) {
		this.buy_time = buy_time;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public int getBuy_price() {
		return buy_price;
	}

	public void setBuy_price(int buy_price) {
		this.buy_price = buy_price;
	}

	public int getPresent_beans() {
		return present_beans;
	}

	public void setPresent_beans(int present_beans) {
		this.present_beans = present_beans;
	}

	public int getPresent_status() {
		return present_status;
	}

	public void setPresent_status(int present_status) {
		this.present_status = present_status;
	}

}
