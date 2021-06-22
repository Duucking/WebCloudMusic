package com.duucking.dao;

import java.util.ArrayList;
import java.util.List;

import com.duucking.model.Music;

public interface MusicDao {

	List<Music> getMusicList(String str1, String str2, String Type);
	List<Music> getRecommendMusicList(ArrayList interest) ;

}
