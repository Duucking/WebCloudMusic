package com.duucking.test;

import java.util.List;
import java.util.ArrayList;

import com.duucking.util.DaoFactory;
import com.duucking.model.Music;

public class TestMusicDaoImpl {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Music> musiclist = new ArrayList<>();
		musiclist = DaoFactory.MusicDao().getMusicList(null, null, "top8");
		System.out.println(musiclist);
	}

}
