program main
  use matrix_ops
  implicit none
  real(8) :: a(2,2) = reshape([1.0d0, 2.0d0, 3.0d0, 4.0d0], [2,2])  ! 2x2 matrix A
  real(8) :: b(2,2) = reshape([5.0d0, 6.0d0, 7.0d0, 8.0d0], [2,2])  ! 2x2 matrix B
  real(8) :: c(2,2) = 0.0d0  ! Result matrix C
  integer :: i

  call matrix_multiply(2, 2, 2, a, b, c)
  write(*,*) "Matrix A:"
  do i = 1, 2
     write(*,*) a(i,:)
  end do
  write(*,*) "Matrix B:"
  do i = 1, 2
     write(*,*) b(i,:)
  end do
  write(*,*) "Result Matrix C = A * B:"
  do i = 1, 2
     write(*,*) c(i,:)
  end do
end program main