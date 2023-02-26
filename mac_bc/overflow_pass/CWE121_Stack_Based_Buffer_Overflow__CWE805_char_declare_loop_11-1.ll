; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx2, align 1, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %1, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !61
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !61
  %4 = load i8*, i8** %data, align 8, !dbg !62
  %5 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !62
  store i8 %3, i8* %arrayidx4, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %6, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !71
  store i8 0, i8* %arrayidx5, align 1, !dbg !72
  %8 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* noundef %8), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i32 (...) @globalReturnsFalse(), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !122
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !123
  store i8 0, i8* %arrayidx2, align 1, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !128
  %cmp = icmp ult i64 %1, 100, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !134
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !134
  %4 = load i8*, i8** %data, align 8, !dbg !135
  %5 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !135
  store i8 %3, i8* %arrayidx4, align 1, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %6, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !143
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !143
  store i8 0, i8* %arrayidx5, align 1, !dbg !144
  %8 = load i8*, i8** %data, align 8, !dbg !145
  call void @printLine(i8* noundef %8), !dbg !146
  ret void, !dbg !147
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %call = call i32 (...) @globalReturnsTrue(), !dbg !155
  %tobool = icmp ne i32 %call, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !158
  store i8* %arraydecay, i8** %data, align 8, !dbg !160
  %0 = load i8*, i8** %data, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !161
  store i8 0, i8* %arrayidx, align 1, !dbg !162
  br label %if.end, !dbg !163

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !169
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx2, align 1, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !175
  %cmp = icmp ult i64 %1, 100, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !181
  %3 = load i8, i8* %arrayidx3, align 1, !dbg !181
  %4 = load i8*, i8** %data, align 8, !dbg !182
  %5 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !182
  store i8 %3, i8* %arrayidx4, align 1, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %6, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !190
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !190
  store i8 0, i8* %arrayidx5, align 1, !dbg !191
  %8 = load i8*, i8** %data, align 8, !dbg !192
  call void @printLine(i8* noundef %8), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 28, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!32 = !DILocation(line: 28, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 31, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !44, line: 94, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 36, column: 16, scope: !40)
!47 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 37, type: !26)
!48 = !DILocation(line: 37, column: 14, scope: !40)
!49 = !DILocation(line: 38, column: 9, scope: !40)
!50 = !DILocation(line: 39, column: 9, scope: !40)
!51 = !DILocation(line: 39, column: 23, scope: !40)
!52 = !DILocation(line: 41, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !40, file: !12, line: 41, column: 9)
!54 = !DILocation(line: 41, column: 14, scope: !53)
!55 = !DILocation(line: 41, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 41, column: 9)
!57 = !DILocation(line: 41, column: 23, scope: !56)
!58 = !DILocation(line: 41, column: 9, scope: !53)
!59 = !DILocation(line: 43, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 42, column: 9)
!61 = !DILocation(line: 43, column: 23, scope: !60)
!62 = !DILocation(line: 43, column: 13, scope: !60)
!63 = !DILocation(line: 43, column: 18, scope: !60)
!64 = !DILocation(line: 43, column: 21, scope: !60)
!65 = !DILocation(line: 44, column: 9, scope: !60)
!66 = !DILocation(line: 41, column: 31, scope: !56)
!67 = !DILocation(line: 41, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 44, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 45, column: 9, scope: !40)
!72 = !DILocation(line: 45, column: 21, scope: !40)
!73 = !DILocation(line: 46, column: 19, scope: !40)
!74 = !DILocation(line: 46, column: 9, scope: !40)
!75 = !DILocation(line: 48, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_11_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!77 = !DILocation(line: 115, column: 5, scope: !76)
!78 = !DILocation(line: 116, column: 5, scope: !76)
!79 = !DILocation(line: 117, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !81, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 129, type: !83)
!86 = !DILocation(line: 129, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 129, type: !84)
!88 = !DILocation(line: 129, column: 27, scope: !80)
!89 = !DILocation(line: 132, column: 22, scope: !80)
!90 = !DILocation(line: 132, column: 12, scope: !80)
!91 = !DILocation(line: 132, column: 5, scope: !80)
!92 = !DILocation(line: 134, column: 5, scope: !80)
!93 = !DILocation(line: 135, column: 5, scope: !80)
!94 = !DILocation(line: 136, column: 5, scope: !80)
!95 = !DILocation(line: 139, column: 5, scope: !80)
!96 = !DILocation(line: 140, column: 5, scope: !80)
!97 = !DILocation(line: 141, column: 5, scope: !80)
!98 = !DILocation(line: 143, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 57, type: !17)
!101 = !DILocation(line: 57, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 58, type: !21)
!103 = !DILocation(line: 58, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 59, type: !26)
!105 = !DILocation(line: 59, column: 10, scope: !99)
!106 = !DILocation(line: 60, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 60, column: 8)
!108 = !DILocation(line: 60, column: 8, scope: !99)
!109 = !DILocation(line: 63, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 61, column: 5)
!111 = !DILocation(line: 64, column: 5, scope: !110)
!112 = !DILocation(line: 68, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !12, line: 66, column: 5)
!114 = !DILocation(line: 68, column: 14, scope: !113)
!115 = !DILocation(line: 69, column: 9, scope: !113)
!116 = !DILocation(line: 69, column: 17, scope: !113)
!117 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 72, type: !41)
!118 = distinct !DILexicalBlock(scope: !99, file: !12, line: 71, column: 5)
!119 = !DILocation(line: 72, column: 16, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 73, type: !26)
!121 = !DILocation(line: 73, column: 14, scope: !118)
!122 = !DILocation(line: 74, column: 9, scope: !118)
!123 = !DILocation(line: 75, column: 9, scope: !118)
!124 = !DILocation(line: 75, column: 23, scope: !118)
!125 = !DILocation(line: 77, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !118, file: !12, line: 77, column: 9)
!127 = !DILocation(line: 77, column: 14, scope: !126)
!128 = !DILocation(line: 77, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 77, column: 9)
!130 = !DILocation(line: 77, column: 23, scope: !129)
!131 = !DILocation(line: 77, column: 9, scope: !126)
!132 = !DILocation(line: 79, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 78, column: 9)
!134 = !DILocation(line: 79, column: 23, scope: !133)
!135 = !DILocation(line: 79, column: 13, scope: !133)
!136 = !DILocation(line: 79, column: 18, scope: !133)
!137 = !DILocation(line: 79, column: 21, scope: !133)
!138 = !DILocation(line: 80, column: 9, scope: !133)
!139 = !DILocation(line: 77, column: 31, scope: !129)
!140 = !DILocation(line: 77, column: 9, scope: !129)
!141 = distinct !{!141, !131, !142, !70}
!142 = !DILocation(line: 80, column: 9, scope: !126)
!143 = !DILocation(line: 81, column: 9, scope: !118)
!144 = !DILocation(line: 81, column: 21, scope: !118)
!145 = !DILocation(line: 82, column: 19, scope: !118)
!146 = !DILocation(line: 82, column: 9, scope: !118)
!147 = !DILocation(line: 84, column: 1, scope: !99)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!149 = !DILocalVariable(name: "data", scope: !148, file: !12, line: 89, type: !17)
!150 = !DILocation(line: 89, column: 12, scope: !148)
!151 = !DILocalVariable(name: "dataBadBuffer", scope: !148, file: !12, line: 90, type: !21)
!152 = !DILocation(line: 90, column: 10, scope: !148)
!153 = !DILocalVariable(name: "dataGoodBuffer", scope: !148, file: !12, line: 91, type: !26)
!154 = !DILocation(line: 91, column: 10, scope: !148)
!155 = !DILocation(line: 92, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !148, file: !12, line: 92, column: 8)
!157 = !DILocation(line: 92, column: 8, scope: !148)
!158 = !DILocation(line: 95, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 93, column: 5)
!160 = !DILocation(line: 95, column: 14, scope: !159)
!161 = !DILocation(line: 96, column: 9, scope: !159)
!162 = !DILocation(line: 96, column: 17, scope: !159)
!163 = !DILocation(line: 97, column: 5, scope: !159)
!164 = !DILocalVariable(name: "i", scope: !165, file: !12, line: 99, type: !41)
!165 = distinct !DILexicalBlock(scope: !148, file: !12, line: 98, column: 5)
!166 = !DILocation(line: 99, column: 16, scope: !165)
!167 = !DILocalVariable(name: "source", scope: !165, file: !12, line: 100, type: !26)
!168 = !DILocation(line: 100, column: 14, scope: !165)
!169 = !DILocation(line: 101, column: 9, scope: !165)
!170 = !DILocation(line: 102, column: 9, scope: !165)
!171 = !DILocation(line: 102, column: 23, scope: !165)
!172 = !DILocation(line: 104, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !165, file: !12, line: 104, column: 9)
!174 = !DILocation(line: 104, column: 14, scope: !173)
!175 = !DILocation(line: 104, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !12, line: 104, column: 9)
!177 = !DILocation(line: 104, column: 23, scope: !176)
!178 = !DILocation(line: 104, column: 9, scope: !173)
!179 = !DILocation(line: 106, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 105, column: 9)
!181 = !DILocation(line: 106, column: 23, scope: !180)
!182 = !DILocation(line: 106, column: 13, scope: !180)
!183 = !DILocation(line: 106, column: 18, scope: !180)
!184 = !DILocation(line: 106, column: 21, scope: !180)
!185 = !DILocation(line: 107, column: 9, scope: !180)
!186 = !DILocation(line: 104, column: 31, scope: !176)
!187 = !DILocation(line: 104, column: 9, scope: !176)
!188 = distinct !{!188, !178, !189, !70}
!189 = !DILocation(line: 107, column: 9, scope: !173)
!190 = !DILocation(line: 108, column: 9, scope: !165)
!191 = !DILocation(line: 108, column: 21, scope: !165)
!192 = !DILocation(line: 109, column: 19, scope: !165)
!193 = !DILocation(line: 109, column: 9, scope: !165)
!194 = !DILocation(line: 111, column: 1, scope: !148)
