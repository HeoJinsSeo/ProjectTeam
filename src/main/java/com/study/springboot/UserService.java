package com.study.springboot;

import com.study.springboot.User;

// 유저 정보 관리용으로 만들어 놓은 인터페이스 입니다
// 사실상 save 함수를 여러군데에서 쓰기 위해 만들었습니다.
public interface UserService 
{
    void save(User user);
}
