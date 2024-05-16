int f(int x, int A[], int y){
 int B[10];
 B[2]=10;
 write "should print 63";
 write"\n";
 write A[3] + B[2] + x + y;
}
int main(void){
 int A[5];
 A[3] = 23;
 f(10, A, 20);
}