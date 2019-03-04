==13147== Helgrind, a thread error detector
==13147== Copyright (C) 2007-2017, and GNU GPL'd, by OpenWorks LLP et al.
==13147== Using Valgrind-3.13.0 and LibVEX; rerun with -h for copyright info
==13147== Command: ./matrix_calc -p -c
==13147== 
==13147== ---Thread-Announcement------------------------------------------
==13147== 
==13147== Thread #1 is the program's root thread
==13147== 
==13147== ---Thread-Announcement------------------------------------------
==13147== 
==13147== Thread #2 was created
==13147==    at 0x4DDADDE: clone (clone.S:71)
==13147==    by 0x4A7BDBE: create_thread (createthread.c:101)
==13147==    by 0x4A7D9F9: pthread_create@@GLIBC_2.2.5 (pthread_create.c:826)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x1FFEFFFB98 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x115472: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_impl::_Vector_impl() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x114775: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_base() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113CE1: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::vector() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x112E4A: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== This conflicts with a previous read of size 8 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x1142FE: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::operator[](unsigned long) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113112: matrix::Matrix::operator[](int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113415: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffb98 is on thread #1's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #2, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 4 at 0x1FFEFFFB90 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x112E52: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== This conflicts with a previous read of size 4 by thread #2
==13147== Locks held: none
==13147==    at 0x113074: matrix::Matrix::get_size() const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1135F7: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x1ffefffb90 is on thread #1's stack
==13147==  in frame #2, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #2, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 8 at 0x1FFEFFFB98 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x1142FE: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::operator[](unsigned long) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113112: matrix::Matrix::operator[](int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113825: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous write of size 8 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x115472: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_impl::_Vector_impl() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x114775: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_base() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113CE1: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::vector() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x112E4A: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffb98 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #1, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 8 at 0x50563D0 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x11426C: std::vector<int, std::allocator<int> >::operator[](unsigned long) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11383B: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147==  Address 0x50563d0 is 0 bytes inside a block of size 48 alloc'd
==13147==    at 0x4838E0F: operator new(unsigned long) (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x1170A0: __gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >::allocate(unsigned long, void const*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1164AF: std::allocator_traits<std::allocator<std::vector<int, std::allocator<int> > > >::allocate(std::allocator<std::vector<int, std::allocator<int> > >&, unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115877: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_allocate(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x116C4E: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_create_storage(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x116298: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_base(unsigned long, std::allocator<std::vector<int, std::allocator<int> > > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115635: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::vector(unsigned long, std::vector<int, std::allocator<int> > const&, std::allocator<std::vector<int, std::allocator<int> > > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1149CD: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_fill_assign(unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113E3A: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::assign(unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x112E9C: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #1
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 4 at 0x5056890 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x11383C: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147==  Address 0x5056890 is 0 bytes inside a block of size 8 alloc'd
==13147==    at 0x4838E0F: operator new(unsigned long) (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x11758F: __gnu_cxx::new_allocator<int>::allocate(unsigned long, void const*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x116B8E: std::allocator_traits<std::allocator<int> >::allocate(std::allocator<int>&, unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1161E5: std::_Vector_base<int, std::allocator<int> >::_M_allocate(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115542: std::_Vector_base<int, std::allocator<int> >::_M_create_storage(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11487E: std::_Vector_base<int, std::allocator<int> >::_Vector_base(unsigned long, std::allocator<int> const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x117AF0: std::vector<int, std::allocator<int> >::vector(std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1179E1: void std::_Construct<std::vector<int, std::allocator<int> >, std::vector<int, std::allocator<int> > const&>(std::vector<int, std::allocator<int> >*, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11700B: std::vector<int, std::allocator<int> >* std::__uninitialized_fill_n<false>::__uninit_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11640D: std::vector<int, std::allocator<int> >* std::uninitialized_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115747: std::vector<int, std::allocator<int> >* std::__uninitialized_fill_n_a<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> >, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&, std::allocator<std::vector<int, std::allocator<int> > >&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1162F5: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_fill_initialize(unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #1
==13147== 
==13147== ---Thread-Announcement------------------------------------------
==13147== 
==13147== Thread #3 was created
==13147==    at 0x4DDADDE: clone (clone.S:71)
==13147==    by 0x4A7BDBE: create_thread (createthread.c:101)
==13147==    by 0x4A7D9F9: pthread_create@@GLIBC_2.2.5 (pthread_create.c:826)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x6441D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11360D: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6441d30 is in a rw- anonymous segment
==13147== 
==13147== Possible data race during read of size 8 at 0x5C40CC0 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x113848: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous write of size 8 by thread #3
==13147== Locks held: 1, at address 0x6441D30
==13147==    at 0x11363B: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==  Address 0x5c40cc0 is on thread #2's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x1FFEFFFB40 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x11385A: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous read of size 8 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x113848: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffb40 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 4 at 0x1FFEFFFB90 by thread #2
==13147== Locks held: none
==13147==    at 0x113074: matrix::Matrix::get_size() const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113746: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous write of size 4 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x112E52: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffb90 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #1, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 4 at 0x1FFEFFFB90 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x113258: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous write of size 4 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x112E52: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffb90 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #2, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 4 at 0x5C40D10 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x112E52: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous read of size 4 by thread #3
==13147== Locks held: none
==13147==    at 0x113074: matrix::Matrix::get_size() const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1135F7: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5c40d10 is on thread #2's stack
==13147==  in frame #2, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #3, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 8 at 0x1FFEFFFB98 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x1142FE: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::operator[](unsigned long) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113112: matrix::Matrix::operator[](int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113314: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147== 
==13147== This conflicts with a previous write of size 8 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x115472: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_impl::_Vector_impl() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x114775: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_base() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113CE1: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::vector() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x112E4A: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffb98 is on thread #1's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #2, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 8 at 0x50563E8 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x11426C: std::vector<int, std::allocator<int> >::operator[](unsigned long) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113327: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147==  Address 0x50563e8 is 24 bytes inside a block of size 48 alloc'd
==13147==    at 0x4838E0F: operator new(unsigned long) (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x1170A0: __gnu_cxx::new_allocator<std::vector<int, std::allocator<int> > >::allocate(unsigned long, void const*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1164AF: std::allocator_traits<std::allocator<std::vector<int, std::allocator<int> > > >::allocate(std::allocator<std::vector<int, std::allocator<int> > >&, unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115877: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_allocate(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x116C4E: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_create_storage(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x116298: std::_Vector_base<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_Vector_base(unsigned long, std::allocator<std::vector<int, std::allocator<int> > > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115635: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::vector(unsigned long, std::vector<int, std::allocator<int> > const&, std::allocator<std::vector<int, std::allocator<int> > > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1149CD: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_fill_assign(unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113E3A: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::assign(unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x112E9C: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #1
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #1, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during read of size 4 at 0x50568E0 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x113328: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147==  Address 0x50568e0 is 0 bytes inside a block of size 8 alloc'd
==13147==    at 0x4838E0F: operator new(unsigned long) (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x11758F: __gnu_cxx::new_allocator<int>::allocate(unsigned long, void const*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x116B8E: std::allocator_traits<std::allocator<int> >::allocate(std::allocator<int>&, unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1161E5: std::_Vector_base<int, std::allocator<int> >::_M_allocate(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115542: std::_Vector_base<int, std::allocator<int> >::_M_create_storage(unsigned long) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11487E: std::_Vector_base<int, std::allocator<int> >::_Vector_base(unsigned long, std::allocator<int> const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x117AF0: std::vector<int, std::allocator<int> >::vector(std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1179E1: void std::_Construct<std::vector<int, std::allocator<int> >, std::vector<int, std::allocator<int> > const&>(std::vector<int, std::allocator<int> >*, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11700B: std::vector<int, std::allocator<int> >* std::__uninitialized_fill_n<false>::__uninit_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11640D: std::vector<int, std::allocator<int> >* std::uninitialized_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x115747: std::vector<int, std::allocator<int> >* std::__uninitialized_fill_n_a<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> >, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&, std::allocator<std::vector<int, std::allocator<int> > >&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1162F5: std::vector<std::vector<int, std::allocator<int> >, std::allocator<std::vector<int, std::allocator<int> > > >::_M_fill_initialize(unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #1
==13147== 
==13147== ---Thread-Announcement------------------------------------------
==13147== 
==13147== Thread #5 was created
==13147==    at 0x4DDADDE: clone (clone.S:71)
==13147==    by 0x4A7BDBE: create_thread (createthread.c:101)
==13147==    by 0x4A7D9F9: pthread_create@@GLIBC_2.2.5 (pthread_create.c:826)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x7443D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11360D: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x7443d30 is on thread #5's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is on thread #2's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x5C40CC0 by thread #5
==13147== Locks held: 1, at address 0x7443D30
==13147==    at 0x11363B: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous read of size 8 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x113848: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==  Address 0x5c40cc0 is on thread #2's stack
==13147==  in frame #4, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147== Possible data race during write of size 4 at 0x5C40D10 by thread #2
==13147== Locks held: none
==13147==    at 0x1138B7: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==    by 0x4DDADEE: clone (clone.S:95)
==13147== 
==13147== This conflicts with a previous read of size 4 by thread #5
==13147== Locks held: none
==13147==    at 0x113074: matrix::Matrix::get_size() const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1135F7: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5c40d10 is on thread #2's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ---Thread-Announcement------------------------------------------
==13147== 
==13147== Thread #4 was created
==13147==    at 0x4DDADDE: clone (clone.S:71)
==13147==    by 0x4A7BDBE: create_thread (createthread.c:101)
==13147==    by 0x4A7D9F9: pthread_create@@GLIBC_2.2.5 (pthread_create.c:826)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x6C42D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6c42d30 is on thread #4's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x5056B50 by thread #4
==13147== Locks held: 1, at address 0x6C42D30
==13147==    at 0x4843104: memset (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D842: get_cached_stack (allocatestack.c:244)
==13147==    by 0x4A7D842: allocate_stack (allocatestack.c:548)
==13147==    by 0x4A7D842: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5056b50 is 16 bytes inside a block of size 288 alloc'd
==13147==    at 0x483A7C5: calloc (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4013726: allocate_dtv (dl-tls.c:286)
==13147==    by 0x4013726: _dl_allocate_tls (dl-tls.c:532)
==13147==    by 0x4A7DD9A: allocate_stack (allocatestack.c:621)
==13147==    by 0x4A7DD9A: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #2
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x6C42D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6c42d30 is on thread #4's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x5056B58 by thread #4
==13147== Locks held: 1, at address 0x6C42D30
==13147==    at 0x4843107: memset (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D842: get_cached_stack (allocatestack.c:244)
==13147==    by 0x4A7D842: allocate_stack (allocatestack.c:548)
==13147==    by 0x4A7D842: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5056b58 is 24 bytes inside a block of size 288 alloc'd
==13147==    at 0x483A7C5: calloc (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4013726: allocate_dtv (dl-tls.c:286)
==13147==    by 0x4013726: _dl_allocate_tls (dl-tls.c:532)
==13147==    by 0x4A7DD9A: allocate_stack (allocatestack.c:621)
==13147==    by 0x4A7DD9A: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #2
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x6C42D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6c42d30 is on thread #4's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x5056B60 by thread #4
==13147== Locks held: 1, at address 0x6C42D30
==13147==    at 0x484310B: memset (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D842: get_cached_stack (allocatestack.c:244)
==13147==    by 0x4A7D842: allocate_stack (allocatestack.c:548)
==13147==    by 0x4A7D842: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5056b60 is 32 bytes inside a block of size 288 alloc'd
==13147==    at 0x483A7C5: calloc (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4013726: allocate_dtv (dl-tls.c:286)
==13147==    by 0x4013726: _dl_allocate_tls (dl-tls.c:532)
==13147==    by 0x4A7DD9A: allocate_stack (allocatestack.c:621)
==13147==    by 0x4A7DD9A: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #2
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x6C42D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6c42d30 is on thread #4's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x5056B68 by thread #4
==13147== Locks held: 1, at address 0x6C42D30
==13147==    at 0x484310F: memset (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D842: get_cached_stack (allocatestack.c:244)
==13147==    by 0x4A7D842: allocate_stack (allocatestack.c:548)
==13147==    by 0x4A7D842: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5056b68 is 40 bytes inside a block of size 288 alloc'd
==13147==    at 0x483A7C5: calloc (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4013726: allocate_dtv (dl-tls.c:286)
==13147==    by 0x4013726: _dl_allocate_tls (dl-tls.c:532)
==13147==    by 0x4A7DD9A: allocate_stack (allocatestack.c:621)
==13147==    by 0x4A7DD9A: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #2
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x6C42D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6c42d30 is on thread #4's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x5056C50 by thread #4
==13147== Locks held: 1, at address 0x6C42D30
==13147==    at 0x4843134: memset (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D842: get_cached_stack (allocatestack.c:244)
==13147==    by 0x4A7D842: allocate_stack (allocatestack.c:548)
==13147==    by 0x4A7D842: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5056c50 is 272 bytes inside a block of size 288 alloc'd
==13147==    at 0x483A7C5: calloc (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4013726: allocate_dtv (dl-tls.c:286)
==13147==    by 0x4013726: _dl_allocate_tls (dl-tls.c:532)
==13147==    by 0x4A7DD9A: allocate_stack (allocatestack.c:621)
==13147==    by 0x4A7DD9A: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #2
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x6C42D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6c42d30 is on thread #4's stack
==13147==  in frame #5, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== Possible data race during write of size 8 at 0x5056C58 by thread #4
==13147== Locks held: 1, at address 0x6C42D30
==13147==    at 0x4843150: memset (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D842: get_cached_stack (allocatestack.c:244)
==13147==    by 0x4A7D842: allocate_stack (allocatestack.c:548)
==13147==    by 0x4A7D842: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x5056c58 is 280 bytes inside a block of size 288 alloc'd
==13147==    at 0x483A7C5: calloc (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4013726: allocate_dtv (dl-tls.c:286)
==13147==    by 0x4013726: _dl_allocate_tls (dl-tls.c:532)
==13147==    by 0x4A7DD9A: allocate_stack (allocatestack.c:621)
==13147==    by 0x4A7DD9A: pthread_create@@GLIBC_2.2.5 (pthread_create.c:669)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Block was alloc'd by thread #2
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x1FFEFFFBB0 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==  Address 0x1ffefffbb0 is on thread #1's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147==  Lock at 0x5C40D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113763: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x5c40d30 is in a rw- anonymous segment
==13147== 
==13147== Possible data race during read of size 8 at 0x1FFEFFFB40 by thread #1
==13147== Locks held: 1, at address 0x1FFEFFFBB0
==13147==    at 0x113848: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== This conflicts with a previous write of size 8 by thread #2
==13147== Locks held: 1, at address 0x5C40D30
==13147==    at 0x11385A: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==  Address 0x1ffefffb40 is on thread #1's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== ---Thread-Announcement------------------------------------------
==13147== 
==13147== Thread #7 was created
==13147==    at 0x4DDADDE: clone (clone.S:71)
==13147==    by 0x4A7BDBE: create_thread (createthread.c:101)
==13147==    by 0x4A7D9F9: pthread_create@@GLIBC_2.2.5 (pthread_create.c:826)
==13147==    by 0x483E2A7: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4BD78F4: std::thread::_M_start_thread(std::unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >, void (*)()) (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x114579: std::thread::thread<void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const>, void>(void (&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1137D0: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147==  Lock at 0x6441D30 was first observed
==13147==    at 0x483B8BC: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x113A88: __gthread_mutex_lock(pthread_mutex_t*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113BEF: std::mutex::lock() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11360D: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==    by 0x483E4A6: ??? (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x4A7D163: start_thread (pthread_create.c:486)
==13147==  Address 0x6441d30 is on thread #7's stack
==13147== 
==13147== Possible data race during write of size 4 at 0x1FFEFFFB90 by thread #1
==13147== Locks held: none
==13147==    at 0x1138B7: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1139BA: matrix::Matrix::determinant() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11A214: main (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== This conflicts with a previous read of size 4 by thread #7
==13147== Locks held: 1, at address 0x6441D30
==13147==    at 0x113258: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118602: decltype (__invoke((_S_declval<0ul>)(), (_S_declval<1ul>)(), (_S_declval<2ul>)())) std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::_M_invoke<0ul, 1ul, 2ul>(std::_Index_tuple<0ul, 1ul, 2ul>) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1185A1: std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > >::operator()() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118585: std::thread::_State_impl<std::thread::_Invoker<std::tuple<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> > > >::_M_run() (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x4BD763E: ??? (in /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25)
==13147==  Address 0x1ffefffb90 is on thread #1's stack
==13147==  in frame #0, created by matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (???:)
==13147== 
==13147== 
==13147== Process terminating with default action of signal 2 (SIGINT)
==13147==    at 0x4843200: memmove (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x11840F: int* std::__copy_move<false, true, std::random_access_iterator_tag>::__copy_m<int>(int const*, int const*, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1181E4: int* std::__copy_move_a<false, int const*, int*>(int const*, int const*, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11850A: int* std::__copy_move_a2<false, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1184B4: int* std::copy<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1183B4: int* std::__uninitialized_copy<true>::__uninit_copy<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118196: int* std::uninitialized_copy<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x117E21: int* std::__uninitialized_copy_a<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*, int>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*, std::allocator<int>&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x117B3E: std::vector<int, std::allocator<int> >::vector(std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1179E1: void std::_Construct<std::vector<int, std::allocator<int> >, std::vector<int, std::allocator<int> > const&>(std::vector<int, std::allocator<int> >*, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11700B: std::vector<int, std::allocator<int> >* std::__uninitialized_fill_n<false>::__uninit_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11640D: std::vector<int, std::allocator<int> >* std::uninitialized_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== ----------------------------------------------------------------
==13147== 
==13147== Thread #7: Exiting thread still holds 1 lock
==13147==    at 0x117D3A: __gnu_cxx::__enable_if<std::__is_scalar<int>::__value, int*>::__type std::__fill_n_a<int*, unsigned long, int>(int*, unsigned long, int const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1175C8: int* std::fill_n<int*, unsigned long, int>(int*, unsigned long, int const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x116BDE: int* std::__uninitialized_fill_n<true>::__uninit_fill_n<int*, unsigned long, int>(int*, unsigned long, int const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11624B: int* std::uninitialized_fill_n<int*, unsigned long, int>(int*, unsigned long, int const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1155DD: int* std::__uninitialized_fill_n_a<int*, unsigned long, int, int>(int*, unsigned long, int const&, std::allocator<int>&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x114929: std::vector<int, std::allocator<int> >::_M_fill_initialize(unsigned long, int const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113DA8: std::vector<int, std::allocator<int> >::vector(unsigned long, int const&, std::allocator<int> const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x112E88: matrix::Matrix::Matrix(int) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11326A: matrix::Matrix::select_minor(int, int) const (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x113783: matrix::parallel_calculate_determinant(long long&, matrix::Matrix const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1152AF: void std::__invoke_impl<void, void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(std::__invoke_other, void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1144C4: std::__invoke_result<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >::type std::__invoke<void (*)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>, std::reference_wrapper<matrix::Matrix const> >(void (*&&)(long long&, matrix::Matrix const&), std::reference_wrapper<long long>&&, std::reference_wrapper<matrix::Matrix const>&&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== ----------------------------------------------------------------
==13147== 
==13147== Thread #4: Exiting thread still holds 1 lock
==13147==    at 0x4843200: memmove (in /usr/lib/valgrind/vgpreload_helgrind-amd64-linux.so)
==13147==    by 0x11840F: int* std::__copy_move<false, true, std::random_access_iterator_tag>::__copy_m<int>(int const*, int const*, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1181E4: int* std::__copy_move_a<false, int const*, int*>(int const*, int const*, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11850A: int* std::__copy_move_a2<false, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1184B4: int* std::copy<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1183B4: int* std::__uninitialized_copy<true>::__uninit_copy<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x118196: int* std::uninitialized_copy<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x117E21: int* std::__uninitialized_copy_a<__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*, int>(__gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, __gnu_cxx::__normal_iterator<int const*, std::vector<int, std::allocator<int> > >, int*, std::allocator<int>&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x117B3E: std::vector<int, std::allocator<int> >::vector(std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x1179E1: void std::_Construct<std::vector<int, std::allocator<int> >, std::vector<int, std::allocator<int> > const&>(std::vector<int, std::allocator<int> >*, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11700B: std::vector<int, std::allocator<int> >* std::__uninitialized_fill_n<false>::__uninit_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147==    by 0x11640D: std::vector<int, std::allocator<int> >* std::uninitialized_fill_n<std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > >(std::vector<int, std::allocator<int> >*, unsigned long, std::vector<int, std::allocator<int> > const&) (in /home/alexandr/Projects/matrix-determinant(pthread)/matrix_calc)
==13147== 
==13147== 
==13147== For counts of detected and suppressed errors, rerun with: -v
==13147== Use --history-level=approx or =none to gain increased speed, at
==13147== the cost of reduced accuracy of conflicting-access information
==13147== ERROR SUMMARY: 110 errors from 25 contexts (suppressed: 76 from 22)
