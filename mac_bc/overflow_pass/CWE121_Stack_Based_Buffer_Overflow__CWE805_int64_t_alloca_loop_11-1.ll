; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = alloca i8, i64 800, align 16, !dbg !28
  %3 = bitcast i8* %2 to i64*, !dbg !29
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !27
  %call = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !33
  store i64* %4, i64** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %6, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !60
  %8 = load i64, i64* %arrayidx, align 8, !dbg !60
  %9 = load i64*, i64** %data, align 8, !dbg !61
  %10 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !61
  store i64 %8, i64* %arrayidx1, align 8, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %11, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !70
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !70
  call void @printLongLongLine(i64 noundef %13), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 400, align 16, !dbg !103
  %1 = bitcast i8* %0 to i64*, !dbg !104
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = alloca i8, i64 800, align 16, !dbg !107
  %3 = bitcast i8* %2 to i64*, !dbg !108
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !106
  %call = call i32 (...) @globalReturnsFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !115
  store i64* %4, i64** %data, align 8, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %6, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !133
  %8 = load i64, i64* %arrayidx, align 8, !dbg !133
  %9 = load i64*, i64** %data, align 8, !dbg !134
  %10 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !134
  store i64 %8, i64* %arrayidx1, align 8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %11, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !142
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !142
  call void @printLongLongLine(i64 noundef %13), !dbg !143
  ret void, !dbg !144
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = alloca i8, i64 400, align 16, !dbg !150
  %1 = bitcast i8* %0 to i64*, !dbg !151
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %2 = alloca i8, i64 800, align 16, !dbg !154
  %3 = bitcast i8* %2 to i64*, !dbg !155
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !153
  %call = call i32 (...) @globalReturnsTrue(), !dbg !156
  %tobool = icmp ne i32 %call, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !159
  store i64* %4, i64** %data, align 8, !dbg !161
  br label %if.end, !dbg !162

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !163, metadata !DIExpression()), !dbg !165
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !172
  %cmp = icmp ult i64 %6, 100, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !178
  %8 = load i64, i64* %arrayidx, align 8, !dbg !178
  %9 = load i64*, i64** %data, align 8, !dbg !179
  %10 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !179
  store i64 %8, i64* %arrayidx1, align 8, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %11, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !187
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !187
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !187
  call void @printLongLongLine(i64 noundef %13), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 24, type: !3)
!23 = !DILocation(line: 24, column: 15, scope: !15)
!24 = !DILocation(line: 24, column: 42, scope: !15)
!25 = !DILocation(line: 24, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 25, type: !3)
!27 = !DILocation(line: 25, column: 15, scope: !15)
!28 = !DILocation(line: 25, column: 43, scope: !15)
!29 = !DILocation(line: 25, column: 32, scope: !15)
!30 = !DILocation(line: 26, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 26, column: 8)
!32 = !DILocation(line: 26, column: 8, scope: !15)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !16, line: 27, column: 5)
!35 = !DILocation(line: 30, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 5, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !16, line: 33, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 33, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !16, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !16, line: 34, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !48, line: 94, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 20, scope: !44)
!51 = !DILocation(line: 37, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !16, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 18, scope: !52)
!54 = !DILocation(line: 37, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !16, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 27, scope: !55)
!57 = !DILocation(line: 37, column: 13, scope: !52)
!58 = !DILocation(line: 39, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !16, line: 38, column: 13)
!60 = !DILocation(line: 39, column: 27, scope: !59)
!61 = !DILocation(line: 39, column: 17, scope: !59)
!62 = !DILocation(line: 39, column: 22, scope: !59)
!63 = !DILocation(line: 39, column: 25, scope: !59)
!64 = !DILocation(line: 40, column: 13, scope: !59)
!65 = !DILocation(line: 37, column: 35, scope: !55)
!66 = !DILocation(line: 37, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 40, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 41, column: 31, scope: !44)
!71 = !DILocation(line: 41, column: 13, scope: !44)
!72 = !DILocation(line: 44, column: 1, scope: !15)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_good", scope: !16, file: !16, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!74 = !DILocation(line: 107, column: 5, scope: !73)
!75 = !DILocation(line: 108, column: 5, scope: !73)
!76 = !DILocation(line: 109, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 121, type: !78, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !16, line: 121, type: !80)
!85 = !DILocation(line: 121, column: 14, scope: !77)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !16, line: 121, type: !81)
!87 = !DILocation(line: 121, column: 27, scope: !77)
!88 = !DILocation(line: 124, column: 22, scope: !77)
!89 = !DILocation(line: 124, column: 12, scope: !77)
!90 = !DILocation(line: 124, column: 5, scope: !77)
!91 = !DILocation(line: 126, column: 5, scope: !77)
!92 = !DILocation(line: 127, column: 5, scope: !77)
!93 = !DILocation(line: 128, column: 5, scope: !77)
!94 = !DILocation(line: 131, column: 5, scope: !77)
!95 = !DILocation(line: 132, column: 5, scope: !77)
!96 = !DILocation(line: 133, column: 5, scope: !77)
!97 = !DILocation(line: 135, column: 5, scope: !77)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!99 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 53, type: !3)
!100 = !DILocation(line: 53, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !16, line: 54, type: !3)
!102 = !DILocation(line: 54, column: 15, scope: !98)
!103 = !DILocation(line: 54, column: 42, scope: !98)
!104 = !DILocation(line: 54, column: 31, scope: !98)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !16, line: 55, type: !3)
!106 = !DILocation(line: 55, column: 15, scope: !98)
!107 = !DILocation(line: 55, column: 43, scope: !98)
!108 = !DILocation(line: 55, column: 32, scope: !98)
!109 = !DILocation(line: 56, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !98, file: !16, line: 56, column: 8)
!111 = !DILocation(line: 56, column: 8, scope: !98)
!112 = !DILocation(line: 59, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !16, line: 57, column: 5)
!114 = !DILocation(line: 60, column: 5, scope: !113)
!115 = !DILocation(line: 64, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !16, line: 62, column: 5)
!117 = !DILocation(line: 64, column: 14, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !119, file: !16, line: 67, type: !39)
!119 = distinct !DILexicalBlock(scope: !98, file: !16, line: 66, column: 5)
!120 = !DILocation(line: 67, column: 17, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !16, line: 69, type: !45)
!122 = distinct !DILexicalBlock(scope: !119, file: !16, line: 68, column: 9)
!123 = !DILocation(line: 69, column: 20, scope: !122)
!124 = !DILocation(line: 71, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !16, line: 71, column: 13)
!126 = !DILocation(line: 71, column: 18, scope: !125)
!127 = !DILocation(line: 71, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !16, line: 71, column: 13)
!129 = !DILocation(line: 71, column: 27, scope: !128)
!130 = !DILocation(line: 71, column: 13, scope: !125)
!131 = !DILocation(line: 73, column: 34, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !16, line: 72, column: 13)
!133 = !DILocation(line: 73, column: 27, scope: !132)
!134 = !DILocation(line: 73, column: 17, scope: !132)
!135 = !DILocation(line: 73, column: 22, scope: !132)
!136 = !DILocation(line: 73, column: 25, scope: !132)
!137 = !DILocation(line: 74, column: 13, scope: !132)
!138 = !DILocation(line: 71, column: 35, scope: !128)
!139 = !DILocation(line: 71, column: 13, scope: !128)
!140 = distinct !{!140, !130, !141, !69}
!141 = !DILocation(line: 74, column: 13, scope: !125)
!142 = !DILocation(line: 75, column: 31, scope: !122)
!143 = !DILocation(line: 75, column: 13, scope: !122)
!144 = !DILocation(line: 78, column: 1, scope: !98)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!146 = !DILocalVariable(name: "data", scope: !145, file: !16, line: 83, type: !3)
!147 = !DILocation(line: 83, column: 15, scope: !145)
!148 = !DILocalVariable(name: "dataBadBuffer", scope: !145, file: !16, line: 84, type: !3)
!149 = !DILocation(line: 84, column: 15, scope: !145)
!150 = !DILocation(line: 84, column: 42, scope: !145)
!151 = !DILocation(line: 84, column: 31, scope: !145)
!152 = !DILocalVariable(name: "dataGoodBuffer", scope: !145, file: !16, line: 85, type: !3)
!153 = !DILocation(line: 85, column: 15, scope: !145)
!154 = !DILocation(line: 85, column: 43, scope: !145)
!155 = !DILocation(line: 85, column: 32, scope: !145)
!156 = !DILocation(line: 86, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !145, file: !16, line: 86, column: 8)
!158 = !DILocation(line: 86, column: 8, scope: !145)
!159 = !DILocation(line: 89, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !16, line: 87, column: 5)
!161 = !DILocation(line: 89, column: 14, scope: !160)
!162 = !DILocation(line: 90, column: 5, scope: !160)
!163 = !DILocalVariable(name: "source", scope: !164, file: !16, line: 92, type: !39)
!164 = distinct !DILexicalBlock(scope: !145, file: !16, line: 91, column: 5)
!165 = !DILocation(line: 92, column: 17, scope: !164)
!166 = !DILocalVariable(name: "i", scope: !167, file: !16, line: 94, type: !45)
!167 = distinct !DILexicalBlock(scope: !164, file: !16, line: 93, column: 9)
!168 = !DILocation(line: 94, column: 20, scope: !167)
!169 = !DILocation(line: 96, column: 20, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !16, line: 96, column: 13)
!171 = !DILocation(line: 96, column: 18, scope: !170)
!172 = !DILocation(line: 96, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !16, line: 96, column: 13)
!174 = !DILocation(line: 96, column: 27, scope: !173)
!175 = !DILocation(line: 96, column: 13, scope: !170)
!176 = !DILocation(line: 98, column: 34, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !16, line: 97, column: 13)
!178 = !DILocation(line: 98, column: 27, scope: !177)
!179 = !DILocation(line: 98, column: 17, scope: !177)
!180 = !DILocation(line: 98, column: 22, scope: !177)
!181 = !DILocation(line: 98, column: 25, scope: !177)
!182 = !DILocation(line: 99, column: 13, scope: !177)
!183 = !DILocation(line: 96, column: 35, scope: !173)
!184 = !DILocation(line: 96, column: 13, scope: !173)
!185 = distinct !{!185, !175, !186, !69}
!186 = !DILocation(line: 99, column: 13, scope: !170)
!187 = !DILocation(line: 100, column: 31, scope: !167)
!188 = !DILocation(line: 100, column: 13, scope: !167)
!189 = !DILocation(line: 103, column: 1, scope: !145)
