package com.berkay.app;

import org.aspectj.bridge.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/todos")
public class TodoController {

    @Autowired
    private TodoRepository todoRepository;

   ///Get all todos from db
   @GetMapping
   public List<Todo> getTodos (){
       return todoRepository.findAll();
   }

    /// Add new to do to db
    @PostMapping("/add")
    public Todo addTodo (@RequestBody Todo todo){
        return todoRepository.save(todo);
    }

    /// Update to do situation
    @PutMapping("/update/{id}")
    public ResponseEntity<String> updateTodo (@PathVariable Long id){
       boolean exist = todoRepository.existsById(id);
       if (exist) {
           /// Fetching todo by id
           Todo todo = todoRepository.getById(id);

           /// Done or not check
           boolean done = todo.isDone();

           /// Reverse it
           todo.setDone(!done);

           /// Save new situation
           todoRepository.save(todo);

           return new ResponseEntity<>(Messages.UPDATED.getMessage(), HttpStatus.OK);
       }
       return new ResponseEntity<>(Messages.NOT_EXIST.getMessage(), HttpStatus.BAD_REQUEST);
    }

    /// Delete to do from db
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteTodo (@PathVariable Long id){
       boolean exist = todoRepository.existsById(id);
       if (exist) {
           /// Deleting to do from db
           todoRepository.deleteById(id);
           return new ResponseEntity<>(Messages.DELETED.getMessage(), HttpStatus.OK);
       }
        return new ResponseEntity<>(Messages.NOT_EXIST.getMessage(), HttpStatus.BAD_REQUEST);
    }

}
