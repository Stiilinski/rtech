<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use Inertia\Inertia;

class PostingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::with('users')->orderBy('created_at', 'desc')->Where('status', 'Active')->get();

        return Inertia::render('Dashboard', [
            'posts' => $posts,
            'authUser' => auth()->user(),
        ]);
    }
    

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string',
            'type' => 'required|string',
            'author' => 'required|exists:users,id', // Ensure author exists in users table
        ]);
    
        $post = Post::create([
            'title' => $validatedData['title'],
            'message' => $validatedData['message'],
            'type' => $validatedData['type'],
            'author' => $validatedData['author'],
        ]);
    
        return redirect()->route('dashboard')->with('success', 'Post created successfully.');
    }    

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string',
            'type' => 'required|string',
        ]);
    
        $post = Post::findOrFail($id);
        $post->update($validatedData);
    
        return redirect()->route('dashboard')->with('success', 'Post updated successfully.');
    }

    public function archive($id)
    {
        $post = Post::findOrFail($id);
        $post->status = 'Inactive';
        $post->save();

        return back()->with('message', 'Post archived successfully');
    }
        

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $post = Post::findOrFail($id);
        $post->delete();
    
        return redirect()->route('dashboard')->with('success', 'Post deleted successfully.');
    }
    
}
