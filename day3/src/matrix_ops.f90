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