module matrix_ops
  implicit none
  private
  public :: matrix_multiply
contains
  subroutine matrix_multiply(m, n, k, a, b, c)
    integer, intent(in) :: m, n, k  ! Matrix dimensions: A(m,k), B(k,n), C(m,n)
    real(8), intent(in) :: a(m,k)   ! Matrix A
    real(8), intent(in) :: b(k,n)   ! Matrix B
    real(8), intent(inout) :: c(m,n) ! Matrix C (result)
    real(8) :: alpha = 1.0d0, beta = 0.0d0  ! Scalars for DGEMM
    ! External BLAS DGEMM routine
    external :: dgemm
    ! Call DGEMM: C = alpha * A * B + beta * C
    call dgemm('N', 'N', m, n, k, alpha, a, m, b, k, beta, c, m)
  end subroutine matrix_multiply
end module matrix_ops


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