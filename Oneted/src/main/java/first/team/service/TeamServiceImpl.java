package first.team.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.team.dao.TeamDAO;

@Service("teamService")
public class TeamServiceImpl implements TeamService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="teamDAO")
	private TeamDAO teamDAO;
	
	
	
	@Override
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception {
		return teamDAO.selectBoardList(map);
	}

	@Override
	public List<Map<String, Object>> selectTeam(Map<String, Object> map) throws Exception {
		return teamDAO.selectTeam(map);
	}

	@Override
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception {
		return teamDAO.selectProjectList(map);
	}

	@Override
	public List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception {
		return teamDAO.selectProject(map);
	}

	@Override
	public List<Map<String, Object>> searchTeamList(Map<String, Object> map) throws Exception {
		return teamDAO.searchTeamList(map);
	}

	@Override
	public List<Map<String, Object>> searchProjectList(Map<String, Object> map) throws Exception {
		return teamDAO.searchProjectList(map);
	}

}