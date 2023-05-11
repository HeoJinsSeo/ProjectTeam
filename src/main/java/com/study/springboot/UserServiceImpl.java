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

@Service
public class UserServiceImpl implements UserService {

    @Override
    public void save(User user) {
        try (RandomAccessFile file = new RandomAccessFile("C:\\Users\\h\\Desktop\\ProjectTeam\\src\\main\\resources\\metadata\\user.csv", "rw")) {
            long fileLength = file.length();
            file.seek(fileLength); // 파일 끝으로 이동
            file.writeBytes(user.getId() + "," + user.getPassword() + "," + user.getAge() + "," + user.getPreference() + "\n");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}