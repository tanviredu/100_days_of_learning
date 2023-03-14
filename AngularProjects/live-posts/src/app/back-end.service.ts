import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { tap } from "rxjs";
import { Post } from "./post.model";
import { PostService } from "./post.service";

@Injectable({providedIn:'root'})
export class BackEndService{
    
    constructor(private postService:PostService,private http:HttpClient){}
    //fun1
    saveData(){
        // get the data
        const listPosts:Post[] = this.postService.getposts();
        // post in the fire base
        this.http.put('https://live-posts-adea0-default-rtdb.firebaseio.com/posts.json',listPosts)
        .subscribe((res)=>{
            console.log(res);
        })

    }

    // fun2
    fetchData(){
        this.http.get<Post[]>('https://live-posts-adea0-default-rtdb.firebaseio.com/posts.json')
        .pipe(
            tap((listOfPosts:Post[])=>{
                console.log(listOfPosts)
                this.postService.setPosts(listOfPosts);
                
            })
        ).subscribe();
    }

}