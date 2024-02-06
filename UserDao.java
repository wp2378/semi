package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import ibatis.IbatisUtil;
import vo.ApplyUser;
import vo.Meeting;
import vo.User;
import vo.Wish;

public class UserDao {

	private SqlMapClient ibatis = IbatisUtil.getSqlMapClient();

	public void insertUser(User user) throws SQLException {
		ibatis.insert("users.insertUser", user);
	}

	public User getUserById(String id) throws SQLException{
		return (User) ibatis.queryForObject("users.getUserById", id);
	}

	public User getUserByEmail(String email) throws SQLException{
		return (User) ibatis.queryForObject("users.getUserByEmail", email);

	}

	public User getUserBynickname(String nickname) throws SQLException{
		return (User) ibatis.queryForObject("users.getUserBynickname", nickname);
	}

	/**
	 * 유저번호로 유저정보 검색
	 * @param no 유저번호
	 * @return 유저정보
	 * @throws SQLException
	 */
	public User getUserByNo(int no) throws SQLException{
		return (User) ibatis.queryForObject("users.getUserByNo", no);
	}

	/**
	 * 유저번호로 유저탈퇴여부 변경
	 * @param no
	 * @throws SQLException
	 */
	public void deleteUserByNo(int no) throws SQLException {
		ibatis.update("users.deleteUserByNo", no);
	}

	/**
	 * 유저정보수정
	 * @param user
	 * @throws SQLException
	 */
	public void updateUser(User user) throws SQLException {
		ibatis.update("users.updateUser", user);
	}

	/**
	 * 유저번호로 유저의 참여일정 조회
	 * @param param 유저번호,조회시작글,조회종료글
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<ApplyUser> getMeetListByNo(Map<String, Object> param) throws SQLException {
		return (List<ApplyUser>) ibatis.queryForList("users.getMeetListByNo", param);

	}

	/**
	 * 유저번호로 유저의 총 참여모임 갯수 조회
	 * @param userNo
	 * @return
	 * @throws SQLException
	 */
	public int getMeetingTotalRows(int userNo) throws SQLException {
		return  (int)ibatis.queryForObject("users.getMeetingTotalRows", userNo);
	}

	/**
	 * 유저번호로 유저의 찜일정 조회
	 * @param param 유저번호,조회시작글,조회종료글
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Wish> getWishListByNo(Map<String, Object> param) throws SQLException {
		return (List<Wish>) ibatis.queryForList("users.getWishListByNo", param);

	}

	/**
	 * 유저번호로 유저의 총 찜모임 갯수 조회
	 * @param userNo
	 * @return
	 * @throws SQLException
	 */
	public int getWishTotalRows(int userNo) throws SQLException {
		return  (int)ibatis.queryForObject("users.getWishTotalRows", userNo);
	}

	/**
	 * 유저번호로 유저의 개설모임일정 조회
	 * @param param 유저번호, 조회시작글, 조회종료글
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public List<Meeting> getHostListByNo(Map<String, Object> param) throws SQLException {
		return (List<Meeting>) ibatis.queryForList("users.getHostListByNo", param);

	}

	/**
	 * 유저번호로 해당 유저가 개설한 모임 갯수 조회
	 * @param userNo
	 * @return
	 * @throws SQLException
	 */
	public int getHostTotalRows(int userNo) throws SQLException {
		return (int)ibatis.queryForObject("users.getHostTotalRows", userNo);
	}


}

