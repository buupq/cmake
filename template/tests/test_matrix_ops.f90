program test_matrix_ops
  use matrix_ops
  implicit none
  real(8) :: a(2,2) = reshape([1.0d0, 2.0d0, 3.0d0, 4.0d0], [2,2])
  real(8) :: b(2,2) = reshape([5.0d0, 6.0d0, 7.0d0, 8.0d0], [2,2])
  real(8) :: c(2,2) = 0.0d0
  real(8) :: expected(2,2) = reshape([23.0d0, 34.0d0, 31.0d0, 46.0d0], [2,2])
  real(8), parameter :: tol = 1.0e-10
  logical :: test_passed
  integer :: i, j

  call matrix_multiply(2, 2, 2, a, b, c)
  test_passed = .true.
  do i = 1, 2
     do j = 1, 2
        if (abs(c(i,j) - expected(i,j)) > tol) then
           test_passed = .false.
        endif
     end do
  end do

  if (test_passed) then
     print *, "Test passed: Matrix multiplication correct"
     call exit(0)  ! Success
  else
     print *, "Test failed: Matrix multiplication incorrect"
     print *, "Expected:"
     do i = 1, 2
        print *, expected(i,:)
     end do
     print *, "Got:"
     do i = 1, 2
        print *, c(i,:)
     end do
     call exit(1)  ! Failure
  endif
end program test_matrix_ops