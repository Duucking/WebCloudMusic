package com.duucking.test;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.duucking.model.Music;
import com.duucking.util.DaoFactory;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		String str = "粤语,ACG,流行";
//		while (true) {
//			int index = str.indexOf(",");
//			if (index != -1) {
//				System.out.println(str.substring(0, index));
//				str=str.substring(index+1, str.length());
//
//			} else {
//				System.out.println(str);
//				break;
//			}
//		}
//		ArrayList list = DaoFactory.UserInterestDao().selectUserInterest("1");
//		System.out.println(DaoFactory.MusicDao().getRecommendMusicList(list));
//		System.out.println(1);
		List<Music> musiclist = new ArrayList<>();
		String returnString = "";
		JSONArray jsonArray = new JSONArray();
		musiclist = DaoFactory.UserSongSheetMusicDao().getSheetMusicList("1");
		for (Music music : musiclist) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name", music.getName());
			if (music.getArtist() != null) {
				jsonObject.put("artist", music.getArtist());
			} else {
				jsonObject.put("artist", music.getBand());
			}
			jsonObject.put("url", music.getFileSource());
			jsonObject.put("cover", music.getCoverFile());
			jsonArray.add(jsonObject);
		}
		System.out.println(jsonArray);

	}

}
