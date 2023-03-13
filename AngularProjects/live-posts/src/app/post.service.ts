import { Injectable } from "@angular/core";
import { Post } from "./post.model";

@Injectable({providedIn:'root'})
export class PostService{
    listOfPosts:Post[] = [
        new Post("Nature",'Nature is a British weekly scientific journal founded and based in London, England. As a multidisciplinary publication, Nature features peer-reviewed research from a variety of academic disciplines, mainly in science and technology.','https://d1whtlypfis84e.cloudfront.net/guides/wp-content/uploads/2019/07/23090714/nature-1024x682.jpeg','test@test.com',new Date(),5),
        new Post("Cricket",'The Indian Premier League is a professional Twenty20 cricket league, contested by eight teams based out of eight different Indian cities. The league was founded by the Board of Control for Cricket in India in 2007. Wikipedia','https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/08/07/917968-ipl.jpg','test@test.com',new Date(),2),
        new Post("Araku Valley",`Araku Valley is a hill station and valley region in the southeastern Indian state of Andhra Pradesh. It's surrounded by the thick forests of the Eastern Ghats mountain range. The Tribal Museum is dedicated to the area's numerous indigenous tribes, known for their traditional Dhimsa dance, and showcases traditional handicrafts.`,'https://vizagtourism.org.in/images/places-to-visit/header/araku-valley-vizag-tourism-entry-fee-timings-holidays-reviews-header.jpg','test@test.com',new Date(),3)
      ];
      // firebase path
      //https://console.firebase.google.com/project/live-posts-adea0/database/live-posts-adea0-default-rtdb/data/~2F
      // facility1
      getposts(){
        return this.listOfPosts;
      }
      // facility 2
      deletePost(index:number){
        this.listOfPosts.splice(index,1);
      }

      // facility 3
      addPost(post:Post){
        this.listOfPosts.push(post)
      
      }

      updatePost(index:number,post:Post){
        this.listOfPosts[index] = post;
      }
      getpost(index:number){
        return this.listOfPosts[index];
      }
      likePost(index:number){
        this.listOfPosts[index].numberOfLikes+=1;
      }


}