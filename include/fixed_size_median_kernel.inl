#if !defined(BE_GFX_FIXED_SIZE_MEDIAN_KERNEL_HPP_) && !defined(DOXYGEN)
#include "fixed_size_median_kernel.hpp"
#elif !defined(BE_GFX_FIXED_SIZE_MEDIAN_KERNEL_INL_)
#define BE_GFX_FIXED_SIZE_MEDIAN_KERNEL_INL_

namespace be {
namespace gfx {

///////////////////////////////////////////////////////////////////////////////
template <typename T, std::size_t N>
void FixedSizeMedianKernel<T, N>::remove(value_type sample) {
   index_type index = to_index_(sample);
   --histogram_[index];
   if (index < median_) {
      --before_median_;
   }
}

///////////////////////////////////////////////////////////////////////////////
template <typename T, std::size_t N>
void FixedSizeMedianKernel<T, N>::insert(value_type sample) {
   index_type index = to_index_(sample);
   ++histogram_[index];
   if (index < median_) {
      ++before_median_;
   }
}

///////////////////////////////////////////////////////////////////////////////
template <typename T, std::size_t N>
typename FixedSizeMedianKernel<T, N>::value_type FixedSizeMedianKernel<T, N>::median() {
   count_type target = median_sample - before_median_;
   if (target >= 0) {
      count_type c;
      while ((c = histogram_[median_]) < target) {
         before_median_ += c;
         ++median_;
         target -= c;
      }
   } else {
      do {
         --median_;
         count_type c = histogram_[median_];
         before_median_ -= c;
         target += c;
      } while (target < 0)
   }
   return to_sample_(median_);
}

///////////////////////////////////////////////////////////////////////////////
template <typename T, std::size_t N>
typename FixedSizeMedianKernel<T, N>::index_type FixedSizeMedianKernel<T, N>::to_index_(value_type sample) const {
   index_type index;
   memcpy(&index, &sample, sizeof(index_type));
   return index;
}

///////////////////////////////////////////////////////////////////////////////
template <typename T, std::size_t N>
typename FixedSizeMedianKernel<T, N>::value_type FixedSizeMedianKernel<T, N>::to_sample_(index_type index) const {
   value_type sample;
   memcpy(&sample, &index, sizeof(value_type));
   return sample;
}

} // be::gfx
} // be

#endif
