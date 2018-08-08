package TestGson;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import entity.DataGrid;

public class tESTgSON {
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		list.add("1");
		DataGrid dg = new DataGrid(10, list);
		Gson gson = new Gson();
		System.out.println(gson.toJson(dg));
	}
}
