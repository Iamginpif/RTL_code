- Gặp khó khăn khi thực hiện full_adder 32bit
  - Có thể viết lại một file mới 
  - Nhưng muốn tái sử dụng full_adder 1 bit 
  - Được a Tòn chỉ là sử dụng generate block
    - Có thể chia thành nhiều file để tái sử dụng (chỉ cần chung một folder?) 
    - Số lần tái sử dụng tùy thuộc vào parameter bạn chọn
    - mới tìm hiểu có 3 loại generate block là dùng for, if...else, case
- Gặp khó khăn trong việc tạo file linting và testbench mới
  - Khi tạo file mới vào folder sim thì cần phải cấp quyền
  - Không thì có thể copy các file đã dùng trước đó ở module khác và thay đổi tham số
