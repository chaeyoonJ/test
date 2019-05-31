package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class GuestbookDAO {
			public boolean create(GuestbookDTO dto) {
				boolean flag = false;
				Connection con = DBOpen.open();
				PreparedStatement pstmt = null;
				
				StringBuffer sql = new StringBuffer();
				sql.append(" insert into guestbook(no, name, gender, title, content, regdate, part, password, grpno) ");
				sql.append(" values((select nvl(max(no),0) + 1 from guestbook), ");
				sql.append("         ?,?,?,?,sysdate,?,?, (select nvl(max(grpno), 0) +1 from guestbook)) ");
				
				try {
					pstmt=con.prepareStatement(sql.toString());
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getGender());
					pstmt.setString(3, dto.getTitle());
					pstmt.setString(4, dto.getContent());
					pstmt.setString(5, dto.getPartstr());
					pstmt.setString(6, dto.getPassword());
					
					int cnt = pstmt.executeUpdate();
					if(cnt>0) flag=true;
				} catch (SQLException e) {
					
					e.printStackTrace();
				}finally {
					DBClose.close(pstmt, con);
				}
				return flag;
			}
			public boolean createReply(GuestbookDTO dto) {
				boolean flag = false;
				Connection con = DBOpen.open();
				PreparedStatement pstmt = null;
				
				StringBuffer sql = new StringBuffer();
				sql.append(" insert into guestbook(no, name, gender, title, content, regdate, part, password, grpno, indent, ansnum) ");
				sql.append(" values((select nvl(max(no),0) + 1 from guestbook), ");
				sql.append("         ?,?,?,?,sysdate,?,?,?,?,? ) ");
				
				try {
					pstmt=con.prepareStatement(sql.toString());
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getGender());
					pstmt.setString(3, dto.getTitle());
					pstmt.setString(4, dto.getContent());
					pstmt.setString(5, dto.getPartstr());
					pstmt.setString(6, dto.getPassword());
					pstmt.setInt(7, dto.getGrpno());
					pstmt.setInt(8, dto.getIndent()+1);
					pstmt.setInt(9, dto.getAnsnum()+1);
					
					int cnt = pstmt.executeUpdate();
					if(cnt>0) flag=true;
				} catch (SQLException e) {
					
					e.printStackTrace();
				}finally {
					DBClose.close(pstmt, con);
				}
				return flag;
			}
			public GuestbookDTO read(int no) {
				GuestbookDTO dto = null;
				Connection con = DBOpen.open();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				StringBuffer sql = new StringBuffer();
				sql.append(" select no, name, gender, title, content, regdate, part  from guestbook ");
				sql.append(" where no = ? ");
				
				try {
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setInt(1, no);
					
					rs=pstmt.executeQuery();
					if(rs.next()) {
						dto= new GuestbookDTO();
						dto.setNo(rs.getInt("no"));
						dto.setName(rs.getString("name"));
						dto.setGender(rs.getString("gender"));
						dto.setTitle(rs.getString("title"));
						dto.setContent(rs.getString("content"));
						dto.setRegdate(rs.getString("regdate"));
						dto.setPartstr(rs.getString("part"));
					
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBClose.close(rs, pstmt, con);
				}
				return dto;
			}
			public GuestbookDTO readReply(int no) {
				GuestbookDTO dto = null;
				Connection con = DBOpen.open();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				StringBuffer sql = new StringBuffer();
				sql.append(" select no, name, gender, title, content, regdate, part, grpno, indent, ansnum  from guestbook ");
				sql.append(" where no = ? ");
				
				try {
					pstmt = con.prepareStatement(sql.toString());
					pstmt.setInt(1, no);
					
					rs=pstmt.executeQuery();
					if(rs.next()) {
						dto= new GuestbookDTO();
						dto.setNo(rs.getInt("no"));
						dto.setName(rs.getString("name"));
						dto.setGender(rs.getString("gender"));
						dto.setTitle(rs.getString("title"));
						dto.setContent(rs.getString("content"));
						dto.setRegdate(rs.getString("regdate"));
						dto.setPartstr(rs.getString("part"));
						dto.setGrpno(rs.getInt("grpno"));
						dto.setIndent(rs.getInt("indent"));
						dto.setAnsnum(rs.getInt("ansnum"));
					
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBClose.close(rs, pstmt, con);
				}
				return dto;
			}
		    public boolean update(GuestbookDTO dto) {
				boolean flag = false;
				Connection con = DBOpen.open();
				PreparedStatement pstmt = null;
				
				StringBuffer sql = new StringBuffer();
				sql.append(" update guestbook set title=? ,");
				sql.append("                      content=? , ");
				sql.append("                      part=? , ");
				sql.append("                      password=? ");
				sql.append(" where no= ? ");
				
				try {
					pstmt=con.prepareStatement(sql.toString());
					pstmt.setString(1, dto.getTitle());
					pstmt.setString(2, dto.getContent());
					pstmt.setString(3, dto.getPartstr());
					pstmt.setString(4, dto.getPassword());
					pstmt.setInt(5, dto.getNo());
					
					int cnt = pstmt.executeUpdate();
					if(cnt>0) flag=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBClose.close(pstmt, con);
				}
				return flag;
			}
			public boolean delete(int no) {
				boolean flag = false;
				Connection con = DBOpen.open();
				PreparedStatement pstmt = null;
				
				StringBuffer sql = new StringBuffer();
				sql.append(" delete from guestbook");
				sql.append(" where no = ? ");
				
				try {
					pstmt=con.prepareStatement(sql.toString());
					pstmt.setInt(1, no);
					
					int cnt = pstmt.executeUpdate();
					if(cnt>0) flag=true;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBClose.close(pstmt, con);
				}
				return flag;
			}
			public List<GuestbookDTO> list(Map map){
				List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
				Connection con = DBOpen.open();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String col = (String)map.get("col");
				String word = (String)map.get("word");
				int sno = (Integer)map.get("sno");
				int eno = (Integer)map.get("eno");
				
				StringBuffer sql = new StringBuffer();
				sql.append("   select no,name,title,part,regdate, grpno, indent, ansnum, r ");
				sql.append("   from(     ");
				sql.append("  		   select no,name,title,part,regdate, grpno, indent, ansnum, rownum r ");
				sql.append(" 		   from(	");
				sql.append(" 					 select no,name,title,part,regdate, grpno, indent, ansnum ");
				sql.append(" 					 from guestbook ");
				
				if(word.trim().length()>0 && col.equals("title_content")) {
				sql.append(" where title like '%' ||?|| '%' ");
				sql.append(" or content like '%' ||?|| '%' ");
				}else if(word.trim().length()>0){
					sql.append(" where " + col + " like '%' ||?|| '%' ");
				}
				
				sql.append(" 					order by grpno desc, ansnum asc ");
				sql.append(" 					)");
				sql.append("             ) where r >= ? and r <= ? ");
				
				try {
					int i=0;
					pstmt = con.prepareStatement(sql.toString());
					if(word.trim().length()>0 && col.equals("title_content")) {
						pstmt.setString(++i, word);
						pstmt.setString(++i, word);
					}else if(word.trim().length()>0) {
						pstmt.setString(++i, word);
					}
					pstmt.setInt(++i, sno);
					pstmt.setInt(++i, eno);
					
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						GuestbookDTO dto = new GuestbookDTO();
						dto.setNo(rs.getInt("no"));
						dto.setName(rs.getString("name"));
						dto.setTitle(rs.getString("title"));
					    dto.setPartstr(rs.getString("part"));
						dto.setRegdate(rs.getString("regdate"));
						dto.setGrpno(rs.getInt("grpno"));
						dto.setIndent(rs.getInt("indent"));
						dto.setAnsnum(rs.getInt("ansnum"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBClose.close(rs, pstmt, con);
				}
				
				return list;
			}
			
			public int total(Map map) {
				int total=0;
				Connection con =DBOpen.open();
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String col = (String)map.get("col");
				String word = (String)map.get("word");
				
				StringBuffer sql = new StringBuffer();
				sql.append(" select count(*) ");
				sql.append(" from guestbook ");
				
				if(word.trim().length()>0 && col.equals("title_content")) {
					sql.append("  where title like '%' ||?|| '%' ");
					sql.append("  or content like '%' ||?|| '%' ");
				}else if(word.trim().length()>0) {
					sql.append("    where "+col+" like '%' ||?|| '%' ");
				}
				
				try {
					pstmt=con.prepareStatement(sql.toString());
					int i = 0;
					if(word.trim().length()>0 && col.equals("title_content")) {
						pstmt.setString(1, word);
						pstmt.setString(2, word);
					}else if(word.trim().length()>0) {
						pstmt.setString(1, word);
					}
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						total =rs.getInt(1);  //첫번째 컬럼(count)을 받아오는거라서 1
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBClose.close(rs, pstmt, con);
				}
				
				return total;
				
			}
			public void upAnsnum(Map map)	{  //파라미터:몇 번 게시물의 조회수를 올릴것인지
				Connection con = DBOpen.open(); //연결객체
				PreparedStatement pstmt = null; //전송객체
				StringBuffer sql = new StringBuffer(); //sql문은 stringbuffer로
				sql.append(" update guestbook ");
				sql.append(" set ansnum = ansnum + 1 ");
				sql.append(" where grpno = ? "); //sql 문 update로 작성
				sql.append(" and ansnum >  ? "); //sql 문 update로 작성
				
				int grpno = (Integer)map.get("grpno");
				int ansnum = (Integer)map.get("ansnum");
				
				try {
					pstmt=con.prepareStatement(sql.toString());
					pstmt.setInt(1, grpno); //전송객체 물음표 setting
					pstmt.setInt(2, ansnum); //전송객체 물음표 setting
					
					pstmt.executeUpdate(); //전송 
					
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				}finally {
					DBClose.close(pstmt, con);
				}
			}
}
//		public boolean passwdcheck(Map map) {
//			boolean flag = false;
//			Connection con = DBOpen.open();
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			int no = (Integer)map.get("no");
//			String password = (String)map.get("password");
//            
//			StringBuffer sql = new StringBuffer();
//            sql.append(" select count(*) from guestbook ");
//            sql.append(" where no = ? ");
//            sql.append(" and password= ? ");
//			
//            try {
//				pstmt=con.prepareStatement(sql.toString());
//				pstmt.setInt(1, no);
//				pstmt.setString(2, password);
//				
//				rs = pstmt.executeQuery();
//				if(rs.next()) {
//					int cnt = rs.getInt(1);
//					
//					if(cnt>0) flag =true;
//				}
//				
//				
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}finally {
//				DBClose.close(rs, pstmt, con);
//			}
//			
//			return flag;
//			
//		}
