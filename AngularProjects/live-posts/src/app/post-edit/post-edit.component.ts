import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Post } from '../post.model';
import { PostService } from '../post.service';

@Component({
  selector: 'app-post-edit',
  templateUrl: './post-edit.component.html',
  styleUrls: ['./post-edit.component.css']
})
export class PostEditComponent implements OnInit{
  
  // creating a  form group
  form!:FormGroup;
  index:number = 0;
  editMode = false;

  private title!:string;
  private description!:string;
  private imagePath!:string;

  constructor(private postService:PostService,private router:Router,private route:ActivatedRoute){}
  ngOnInit(): void {
    this.route.params.subscribe((params:Params)=>{
      if(params['index']){
        console.log(params['index']);
        this.index = params['index'];
        const post = this.postService.getpost(this.index);
        this.title = post.title;
        this.description = post.description;
        this.imagePath = post.imagePath;
        this.editMode = true;

      }
    })

    this.form = new FormGroup({
      title: new FormControl(this.title,[Validators.required,Validators.maxLength(10)]),
      description: new FormControl(this.description,[Validators.maxLength(300),Validators.required]),
      imagePath: new FormControl(this.imagePath,[Validators.required])
    });
  }
  onSubmit(){
    //console.log("onSubmit() Clicked");
    //console.log(this.form);
    const title = this.form.value.title;
    const description = this.form.value.description;
    const imagePath = this.form.value.imagePath;
    const post : Post = new Post(title,description,imagePath,'test@test.com',new Date())
    this.postService.addPost(post);
    this.router.navigate(['post-list'])
  };

  

}
