package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class ProjectDAO {
	public void upViewcnt(int imgno)	{  //파라미터:몇 번 게시물의 조회수를 올릴것인지
		Connection con = DBOpen.open(); //연결객체
		PreparedStatement pstmt = null; //전송객체
		StringBuffer sql = new StringBuffer(); //sql문은 stringbuffer로
		sql.append(" update project ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where imgno = ? "); //sql 문 update로 작성
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno); //전송객체 물음표 setting
			
			pstmt.executeUpdate(); //전송 
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
	}
	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(imgno) as cnt ");
		sql.append(" from project ");
		sql.append(" where imgno= ? ");
		sql.append(" and passwd= ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, (Integer)map.get("imgno"));
			pstmt.setString(2, (String)map.get("passwd"));

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt > 0)
					flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}

	public int total(Map map) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from project ");

		if (word.trim().length() > 0)
			sql.append(" where " + col + "like '%' ||?|| '%' ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;
	}

	public boolean duplicateId(String id) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(id) ");
		sql.append(" from project ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);

				if (cnt > 0)
					flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}

	public boolean create(ProjectDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into project(imgno, mname, passwd, title, content, wdate, fname)  ");
		sql.append(" values(project_seq.nextval, ?, ?, ?, ?, sysdate, ?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getFname());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean update(ProjectDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" update project ");
		sql.append(" set ");
		sql.append(" fname = ?, ");
		sql.append(" title = ?, ");
		sql.append(" content = ? ");
		sql.append(" where imgno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getImgno());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public boolean delete(int imgno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from project ");
		sql.append(" where imgno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public ProjectDTO read(int imgno) {
		ProjectDTO dto = new ProjectDTO();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select imgno, mname, title, content, fname from project ");
		sql.append(" where imgno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new ProjectDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setMname(rs.getString("mname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFname(rs.getString("fname"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}

	public List imgRead(int imgno) {
		List list = new ArrayList();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(imgno,2)     over (order by imgno) pre_imgno2,    ");
		sql.append("          lag(imgno,1)     over (order by imgno ) pre_imgno1,   ");
		sql.append("          imgno,  ");
		sql.append("          lead(imgno,1)    over (order by imgno) nex_imgno1,    ");
		sql.append("          lead(imgno,2)    over (order by imgno) nex_imgno2,    ");
		sql.append("          lag(fname,2)  over (order by imgno) pre_file2,     ");
		sql.append("          lag(fname,1)  over (order by imgno ) pre_file1,  ");
		sql.append("          fname,   ");
		sql.append("          lead(fname,1) over (order by imgno) nex_file1,  ");
		sql.append("          lead(fname,2) over (order by imgno) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT imgno, fname   ");
		sql.append("               FROM project ");
		sql.append("               ORDER BY imgno DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE imgno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int[] noArr = { rs.getInt("pre_imgno2"), rs.getInt("pre_imgno1"), rs.getInt("imgno"),
						rs.getInt("nex_imgno1"), rs.getInt("nex_imgno2") };
				String[] files = { rs.getString("pre_file2"), rs.getString("pre_file1"), rs.getString("fname"),
						rs.getString("nex_file1"), rs.getString("nex_file2") };

				list.add(files);
				list.add(noArr);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);

		}

		return list;
	}

	public List<ProjectDTO> list(Map map) {
		List<ProjectDTO> list = new ArrayList<ProjectDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();
		sql.append(" select imgno, mname, title, viewcnt, fname, wdate, r ");
		sql.append("  from(       ");
		sql.append("        select imgno, mname, title, viewcnt, fname, wdate, rownum r ");
		sql.append("             from( ");
		sql.append("                 select imgno, mname, title, viewcnt, fname, wdate ");
		sql.append("                 from project ");

		if (word.trim().length() > 0)
			sql.append("                 where " + col + " like '%' ||?|| '%' ");
		sql.append("                 order by imgno desc ");
		sql.append("                 ) ");
		sql.append("       )where r>=? and r<=? ");

		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProjectDTO dto = new ProjectDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setMname(rs.getString("mname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setFname(rs.getString("fname"));
				dto.setWdate(rs.getString("wdate"));

				list.add(dto);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}
}
