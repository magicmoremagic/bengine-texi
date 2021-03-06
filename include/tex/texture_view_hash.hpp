#pragma once
#ifndef BE_GFX_TEX_TEXTURE_VIEW_HASH_HPP_
#define BE_GFX_TEX_TEXTURE_VIEW_HASH_HPP_

#include "texture_view.hpp"
#include <be/core/alg.hpp>
#include <functional>

/*!! write_template('common/templates/std_hash', 'be::gfx::tex::TextureView')
write_template('common/templates/std_hash', 'be::gfx::tex::ConstTextureView') !! 20 */
/* ################# !! GENERATED CODE -- DO NOT MODIFY !! ################# */

template <>
struct std::hash<be::gfx::tex::TextureView> {
   std::size_t operator()(const be::gfx::tex::TextureView& o) const {
      using be::std_hash;
      return std_hash(o);
   }
};

template <>
struct std::hash<be::gfx::tex::ConstTextureView> {
   std::size_t operator()(const be::gfx::tex::ConstTextureView& o) const {
      using be::std_hash;
      return std_hash(o);
   }
};

/* ######################### END OF GENERATED CODE ######################### */

#endif
