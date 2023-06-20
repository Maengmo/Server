package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.test.my.DBUtil;

public class ZipcodeDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public ZipcodeDAO() {
        this.conn = DBUtil.open();
    }

    public List<ZipcodeDTO> listZipcode(String name) {

        try {
            String sql = "SELECT * FROM zipcode WHERE dong LIKE ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + name + "%");
            rs = pstmt.executeQuery();

            List<ZipcodeDTO> list = new ArrayList<>();

            while (rs.next()) {
                ZipcodeDTO dto = new ZipcodeDTO();
                dto.setZip(rs.getString("zip"));
                dto.setSido(rs.getString("sido"));
                dto.setGugun(rs.getString("gugun"));
                dto.setDong(rs.getString("dong"));
                dto.setBunji(rs.getString("bunji"));
                list.add(dto);
            }

            return list;

        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return null;
    }

}