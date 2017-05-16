#pragma once
#ifndef BE_GFX_TEX_TEXTURE_FILE_FORMAT_JPEG_HPP_
#define BE_GFX_TEX_TEXTURE_FILE_FORMAT_JPEG_HPP_

#include <be/core/buf.hpp>

namespace be::gfx::tex::detail {

bool is_jpeg(const Buf<const UC>& buf);

} // be::gfx::tex::detail

#endif
