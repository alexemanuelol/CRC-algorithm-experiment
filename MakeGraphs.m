clf

subplot(2,2,1)

load('poly4.mat')
bar(0:length(error) - 1, error, 0.7)
axis([0.1 (insertedErrors + 1) cycles*9/10 (cycles+cycles/200)])

title('4-bit')
xlabel('Inverterade bitar {\itf}')
ylabel('Upptäckta fel')


subplot(2,2,2)

load('poly8.mat')
bar(0:length(error) - 1, error, 0.7)
axis([0.1 (insertedErrors + 1) cycles*9/10 (cycles+cycles/200)])

title('8-bit')
xlabel('Inverterade bitar {\itf}')
ylabel('Upptäckta fel')

subplot(2,2,3)

load('poly16.mat')
bar(0:length(error) - 1, error, 0.7)
axis([0.1 (insertedErrors + 1) cycles*9/10 (cycles+cycles/200)])

title('16-bit')
xlabel('Inverterade bitar {\itf}')
ylabel('Upptäckta fel')


subplot(2,2,4)

load('poly32.mat')
bar(0:length(error) - 1, error, 0.7)
axis([0.1 (insertedErrors + 1) cycles*9/10 (cycles+cycles/200)])

title('32-bit')
xlabel('Inverterade bitar {\itf}')
ylabel('Upptäckta fel')