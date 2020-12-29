<?php

namespace App\Models;

// use Dotenv\Util\Str;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Blog extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'post', 'post_excerpt', 'slug', 'user_id', 'featuredImage', 'metaDescription', 'views', 'jsonData'];

    public function setTitleAttribute($title)
    {
        $this->attributes['slug'] = $this->uniqueSlug($title);
    }

    private function uniqueSlug($title)
    {
        $slug = Str::slug($title, '-'); // this is ===> this-is
        $count = Blog::where('slug', 'LIKE', "{$slug}%")->count();
        $newCount = $count > 0 ? ++$count : '';
        return $newCount > 0 ? "$slug-$newCount" : $slug;
    }
    public function tag()
    {
        return $this->belongsToMany('App\Models\Tag', 'blogtags');
    }
    public function cat()
    {
        return $this->belongsToMany('App\Models\Category', 'blogcategories');
    }
}
