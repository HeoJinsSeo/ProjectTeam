package com.study.springboot;

import org.springframework.stereotype.Service;

import com.study.springboot.User;
import com.study.springboot.UserService;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.io.RandomAccessFile;

// 유저정보를 입력받았을때, csv 파일로 저장하는 클래스입니다. 

@Service
public class UserServiceImpl implements UserService {

	// save 함수(회원가입 받기용)
    @Override
    public void save(User user) {
        try (RandomAccessFile file = new RandomAccessFile("C:\\Users\\h\\Desktop\\ProjectTeam\\src\\main\\resources\\metadata\\user.csv", "rw")) {
            long fileLength = file.length();
            file.seek(fileLength); // 파일 끝으로 이동 앞에 내용 덮어쓰기 방지용
            file.writeBytes(user.getId() + "," + user.getPassword() + "," + user.getAge() + "," + user.getPreference() + "," + user.getRank() + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}