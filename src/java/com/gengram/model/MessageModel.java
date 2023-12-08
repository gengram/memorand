package com.gengram.model;

public class MessageModel {
    
    private String content;
    private String username;

    public MessageModel(String content, String username) {
        this.content = content;
        this.username = username;
    }

    @Override
    public String toString() {
        return "MessageModel{" + "content=" + content + ", username=" + username + '}';
    }
 
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
}
