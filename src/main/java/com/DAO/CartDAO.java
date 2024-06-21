package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {

	public boolean addCart(Cart c);

	public List<Cart> getDeviceByUser(int userId);

	public boolean deleteDevice(int bid, int uid, int cid);
}
