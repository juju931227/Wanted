package first.team.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("teamDAO")
public class TeamDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeamInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("team.selectTeamInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamMember(Map<String, Object> map) {
		return selectList("team.selectTeamMember", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("team.selectMemberInfo", map);
	}
}