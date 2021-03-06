local no_write = ...

include 'common/enum'
include 'common/load_tsv'

local data = load_tsv(resolve_include_path('tex/block_packing.tsv'), function (token, key)
   if key == 'name' then
      return token
   else
      return tonumber(token)
   end
end)

local packing = make_enum_class('be::gfx::tex::BlockPacking', 'U8', data)
image_block_packing = packing

if not no_write then
   unsigned_word_types = {
      [1] = 'U8',
      [2] = 'U16',
      [4] = 'U32',
      [8] = 'U64'
   }

   local packing_is_compressed_map = { name = 'is_compressed', enum = packing, predicate = function (constant) return constant.n_fields == 0 end }
   local packing_is_packed_map     = { name = 'is_packed',     enum = packing, predicate = function (constant) return constant.n_fields ~= constant.n_words end }

   local packing_n_fields_map = { name = 'field_count',  enum = packing, type = 'U8', mapper = 'n_fields',    default = 3 }
   local packing_word_size    = { name = 'block_word_size',  enum = packing, type = 'U8', mapper = 'word_size', default = 4 }
   local packing_n_words      = { name = 'block_word_count', enum = packing, type = 'U8', mapper = 'n_words',   default = 1 }
   local packing_pixel_size   = { name = 'block_pixel_size', enum = packing, type = 'U8', mapper = function (constant) return constant.n_words * constant.word_size end, default = 4 }

   local packing_word_offset_0 = { name = 'block_word_offset_0', enum = packing, type = 'U8', mapper = 'w0', default = 0 }
   local packing_word_offset_1 = { name = 'block_word_offset_1', enum = packing, type = 'U8', mapper = 'w1', default = 0 }
   local packing_word_offset_2 = { name = 'block_word_offset_2', enum = packing, type = 'U8', mapper = 'w2', default = 0 }
   local packing_word_offset_3 = { name = 'block_word_offset_3', enum = packing, type = 'U8', mapper = 'w3', default = 0 }

   local packing_bit_offset_0 = { name = 'block_bit_offset_0', enum = packing, type = 'U8', mapper = 'o0', default = 0 }
   local packing_bit_offset_1 = { name = 'block_bit_offset_1', enum = packing, type = 'U8', mapper = 'o1', default = 0 }
   local packing_bit_offset_2 = { name = 'block_bit_offset_2', enum = packing, type = 'U8', mapper = 'o2', default = 0 }
   local packing_bit_offset_3 = { name = 'block_bit_offset_3', enum = packing, type = 'U8', mapper = 'o3', default = 0 }

   local packing_bit_width_0 = { name = 'block_bit_width_0', enum = packing, type = 'U8', mapper = 'b0', default = 0 }
   local packing_bit_width_1 = { name = 'block_bit_width_1', enum = packing, type = 'U8', mapper = 'b1', default = 0 }
   local packing_bit_width_2 = { name = 'block_bit_width_2', enum = packing, type = 'U8', mapper = 'b2', default = 0 }
   local packing_bit_width_3 = { name = 'block_bit_width_3', enum = packing, type = 'U8', mapper = 'b3', default = 0 }

   include('common/enum_std_begin', packing)

   if file_ext == '.hpp' then
      write_template('common/templates/enum_bool_mapping_decl', packing_is_compressed_map)
      write_template('common/templates/enum_bool_mapping_decl', packing_is_packed_map)
      write_template('common/templates/enum_scalar_mapping_decl', packing_n_fields_map)
      write_template('common/templates/enum_scalar_mapping_decl', packing_pixel_size)
      write_template('common/templates/enum_scalar_mapping_decl', packing_word_size)
      write_template('common/templates/enum_scalar_mapping_decl', packing_n_words)
      write_template('common/templates/enum_scalar_mapping_decl', packing_word_offset_0)
      write_template('common/templates/enum_scalar_mapping_decl', packing_word_offset_1)
      write_template('common/templates/enum_scalar_mapping_decl', packing_word_offset_2)
      write_template('common/templates/enum_scalar_mapping_decl', packing_word_offset_3)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_offset_0)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_offset_1)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_offset_2)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_offset_3)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_width_0)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_width_1)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_width_2)
      write_template('common/templates/enum_scalar_mapping_decl', packing_bit_width_3)
      write_template('tex/block_packing_info', packing)
   else
      write_template('common/templates/enum_bool_mapping', packing_is_compressed_map)
      write_template('common/templates/enum_bool_mapping', packing_is_packed_map)
      write_template('common/templates/enum_scalar_mapping', packing_n_fields_map)
      write_template('common/templates/enum_scalar_mapping', packing_pixel_size)
      write_template('common/templates/enum_scalar_mapping', packing_word_size)
      write_template('common/templates/enum_scalar_mapping', packing_n_words)
      write_template('common/templates/enum_scalar_mapping', packing_word_offset_0)
      write_template('common/templates/enum_scalar_mapping', packing_word_offset_1)
      write_template('common/templates/enum_scalar_mapping', packing_word_offset_2)
      write_template('common/templates/enum_scalar_mapping', packing_word_offset_3)
      write_template('common/templates/enum_scalar_mapping', packing_bit_offset_0)
      write_template('common/templates/enum_scalar_mapping', packing_bit_offset_1)
      write_template('common/templates/enum_scalar_mapping', packing_bit_offset_2)
      write_template('common/templates/enum_scalar_mapping', packing_bit_offset_3)
      write_template('common/templates/enum_scalar_mapping', packing_bit_width_0)
      write_template('common/templates/enum_scalar_mapping', packing_bit_width_1)
      write_template('common/templates/enum_scalar_mapping', packing_bit_width_2)
      write_template('common/templates/enum_scalar_mapping', packing_bit_width_3)
   end

   include('common/enum_std_end', packing)
end
