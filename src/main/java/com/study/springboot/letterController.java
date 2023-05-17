package com.study.springboot;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class letterController {
	@RequestMapping({"/table_button"})
	public String button(@RequestParam("buttonId") String buttonId,
			@RequestParam(value = "inputField", required = false) String inputField) {
		System.out.println(buttonId);
		if (buttonId.equals("searchButton")) {
			return "redirect:/filter";
		} else if (buttonId.equals("writeButton")) {
			return "redirect:/letter_new";
		} else if (buttonId.equals("return")) {
			return "redirect:/letter_table";
		} else if (buttonId.equals("delete")) {
			return "redirect:/letter_table";
		} else if (buttonId.equals("registry")) {
			return "redirect:/letter_table";
		} else if (buttonId.equals("post")) {
			System.out.println(buttonId);
			System.out.println(inputField);
			return inputField != null ? "redirect:/letter_table?inputValue=" + inputField : "redirect:/letter_table";
		} else if (buttonId.equals("add")) {
			return "redirect:/letter_table";
		} else if (buttonId.equals("import")) {
			return "redirect:/letter_table";
		} else {
			return buttonId.equals("back") ? "redirect:/letter_table" : "resultDefault";
		}
	}

	@RequestMapping({"/letter_table"})
	public String letter(Model model, @RequestParam(value = "inputValue", required = false) String inputValue) {
		int length = 10;
		if (inputValue != null) {
			++length;
		}

		List<Letter> letterList = new ArrayList();

		for (int i = 1; i <= length; i++) {
			String date = "Date " + i;
			String title = "Title " + i;
			String writer = "Writer " + i;
			int like = i * 10;
			Letter letter = new Letter(date, title, writer, like);
			letterList.add(letter);
		}

		if (inputValue != null) {
			System.out.println(inputValue);
			String date = "Custom Date";
			String writer = "Custom Writer";
			int like = 0;
			Letter letter = new Letter(date, inputValue, writer, like);
			letterList.add(letter);
		}

		model.addAttribute("length", length);
		model.addAttribute("letter", letterList);
		return "letter_table";
	}

	@RequestMapping({"/letter_show"})
	private String letter_show() {
		return "letter_show";
	}

	@RequestMapping({"/letter_new"})
	private String letter_new(Model model) {
		return "letter_new";
	}

	@RequestMapping({"/file_list"})
	public String fileList(Model model) {
		List<String> fileLinkList = new ArrayList();
		model.addAttribute("fileLinkList", fileLinkList);
		return "file_list";
	}
}