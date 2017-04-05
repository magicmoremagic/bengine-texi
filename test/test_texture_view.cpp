#ifdef BE_TEST

#include "texture_view_hash.hpp"
#include <catch/catch.hpp>
#include <unordered_set>

#define BE_CATCH_TAGS "[gfx][gfx:TextureView]"

using namespace be;

TEST_CASE("std::hash<TextureView>", BE_CATCH_TAGS) {
   std::unordered_set<be::gfx::TextureView> stet;
   REQUIRE_NOTHROW(stet.emplace());
}

// TODO visit_texture_images
// TODO visit_texture_blocks
// TODO visit_texture_pixels

#endif
