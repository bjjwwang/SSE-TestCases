; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %call = call i32 (...) @globalReturnsTrue(), !dbg !34
  %tobool = icmp ne i32 %call, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx3, align 4, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %1, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !65
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !65
  %4 = load i32*, i32** %data, align 8, !dbg !66
  %5 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !66
  store i32 %3, i32* %arrayidx5, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %6, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !75
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !75
  store i32 0, i32* %arrayidx6, align 4, !dbg !76
  %8 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* noundef %8), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i32 (...) @globalReturnsFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store i32* %arraydecay, i32** %data, align 8, !dbg !119
  %0 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !128
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx3, align 4, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !134
  %cmp = icmp ult i64 %1, 100, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !140
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !140
  %4 = load i32*, i32** %data, align 8, !dbg !141
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !141
  store i32 %3, i32* %arrayidx5, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %6, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !149
  store i32 0, i32* %arrayidx6, align 4, !dbg !150
  %8 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* noundef %8), !dbg !152
  ret void, !dbg !153
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %call = call i32 (...) @globalReturnsTrue(), !dbg !161
  %tobool = icmp ne i32 %call, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !164
  store i32* %arraydecay, i32** %data, align 8, !dbg !166
  %0 = load i32*, i32** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !175
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !176
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !177
  store i32 0, i32* %arrayidx3, align 4, !dbg !178
  store i64 0, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !182
  %cmp = icmp ult i64 %1, 100, !dbg !184
  br i1 %cmp, label %for.body, label %for.end, !dbg !185

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !188
  %3 = load i32, i32* %arrayidx4, align 4, !dbg !188
  %4 = load i32*, i32** %data, align 8, !dbg !189
  %5 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx5 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !189
  store i32 %3, i32* %arrayidx5, align 4, !dbg !191
  br label %for.inc, !dbg !192

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !193
  %inc = add i64 %6, 1, !dbg !193
  store i64 %inc, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !194, !llvm.loop !195

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !197
  %arrayidx6 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !197
  store i32 0, i32* %arrayidx6, align 4, !dbg !198
  %8 = load i32*, i32** %data, align 8, !dbg !199
  call void @printWLine(i32* noundef %8), !dbg !200
  ret void, !dbg !201
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 28, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!36 = !DILocation(line: 28, column: 8, scope: !11)
!37 = !DILocation(line: 32, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !12, line: 29, column: 5)
!39 = !DILocation(line: 32, column: 14, scope: !38)
!40 = !DILocation(line: 33, column: 9, scope: !38)
!41 = !DILocation(line: 33, column: 17, scope: !38)
!42 = !DILocation(line: 34, column: 5, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 36, type: !45)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !48)
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 36, column: 16, scope: !44)
!50 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 37, type: !30)
!51 = !DILocation(line: 37, column: 17, scope: !44)
!52 = !DILocation(line: 38, column: 17, scope: !44)
!53 = !DILocation(line: 38, column: 9, scope: !44)
!54 = !DILocation(line: 39, column: 9, scope: !44)
!55 = !DILocation(line: 39, column: 23, scope: !44)
!56 = !DILocation(line: 41, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !44, file: !12, line: 41, column: 9)
!58 = !DILocation(line: 41, column: 14, scope: !57)
!59 = !DILocation(line: 41, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 41, column: 9)
!61 = !DILocation(line: 41, column: 23, scope: !60)
!62 = !DILocation(line: 41, column: 9, scope: !57)
!63 = !DILocation(line: 43, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 42, column: 9)
!65 = !DILocation(line: 43, column: 23, scope: !64)
!66 = !DILocation(line: 43, column: 13, scope: !64)
!67 = !DILocation(line: 43, column: 18, scope: !64)
!68 = !DILocation(line: 43, column: 21, scope: !64)
!69 = !DILocation(line: 44, column: 9, scope: !64)
!70 = !DILocation(line: 41, column: 31, scope: !60)
!71 = !DILocation(line: 41, column: 9, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 44, column: 9, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 45, column: 9, scope: !44)
!76 = !DILocation(line: 45, column: 21, scope: !44)
!77 = !DILocation(line: 46, column: 20, scope: !44)
!78 = !DILocation(line: 46, column: 9, scope: !44)
!79 = !DILocation(line: 48, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_11_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocation(line: 115, column: 5, scope: !80)
!82 = !DILocation(line: 116, column: 5, scope: !80)
!83 = !DILocation(line: 117, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !85, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!85 = !DISubroutineType(types: !86)
!86 = !{!22, !22, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 129, type: !22)
!91 = !DILocation(line: 129, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 129, type: !87)
!93 = !DILocation(line: 129, column: 27, scope: !84)
!94 = !DILocation(line: 132, column: 22, scope: !84)
!95 = !DILocation(line: 132, column: 12, scope: !84)
!96 = !DILocation(line: 132, column: 5, scope: !84)
!97 = !DILocation(line: 134, column: 5, scope: !84)
!98 = !DILocation(line: 135, column: 5, scope: !84)
!99 = !DILocation(line: 136, column: 5, scope: !84)
!100 = !DILocation(line: 139, column: 5, scope: !84)
!101 = !DILocation(line: 140, column: 5, scope: !84)
!102 = !DILocation(line: 141, column: 5, scope: !84)
!103 = !DILocation(line: 143, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 57, type: !17)
!106 = !DILocation(line: 57, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 58, type: !25)
!108 = !DILocation(line: 58, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 59, type: !30)
!110 = !DILocation(line: 59, column: 13, scope: !104)
!111 = !DILocation(line: 60, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 60, column: 8)
!113 = !DILocation(line: 60, column: 8, scope: !104)
!114 = !DILocation(line: 63, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 61, column: 5)
!116 = !DILocation(line: 64, column: 5, scope: !115)
!117 = !DILocation(line: 68, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !12, line: 66, column: 5)
!119 = !DILocation(line: 68, column: 14, scope: !118)
!120 = !DILocation(line: 69, column: 9, scope: !118)
!121 = !DILocation(line: 69, column: 17, scope: !118)
!122 = !DILocalVariable(name: "i", scope: !123, file: !12, line: 72, type: !45)
!123 = distinct !DILexicalBlock(scope: !104, file: !12, line: 71, column: 5)
!124 = !DILocation(line: 72, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !12, line: 73, type: !30)
!126 = !DILocation(line: 73, column: 17, scope: !123)
!127 = !DILocation(line: 74, column: 17, scope: !123)
!128 = !DILocation(line: 74, column: 9, scope: !123)
!129 = !DILocation(line: 75, column: 9, scope: !123)
!130 = !DILocation(line: 75, column: 23, scope: !123)
!131 = !DILocation(line: 77, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !12, line: 77, column: 9)
!133 = !DILocation(line: 77, column: 14, scope: !132)
!134 = !DILocation(line: 77, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !12, line: 77, column: 9)
!136 = !DILocation(line: 77, column: 23, scope: !135)
!137 = !DILocation(line: 77, column: 9, scope: !132)
!138 = !DILocation(line: 79, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !12, line: 78, column: 9)
!140 = !DILocation(line: 79, column: 23, scope: !139)
!141 = !DILocation(line: 79, column: 13, scope: !139)
!142 = !DILocation(line: 79, column: 18, scope: !139)
!143 = !DILocation(line: 79, column: 21, scope: !139)
!144 = !DILocation(line: 80, column: 9, scope: !139)
!145 = !DILocation(line: 77, column: 31, scope: !135)
!146 = !DILocation(line: 77, column: 9, scope: !135)
!147 = distinct !{!147, !137, !148, !74}
!148 = !DILocation(line: 80, column: 9, scope: !132)
!149 = !DILocation(line: 81, column: 9, scope: !123)
!150 = !DILocation(line: 81, column: 21, scope: !123)
!151 = !DILocation(line: 82, column: 20, scope: !123)
!152 = !DILocation(line: 82, column: 9, scope: !123)
!153 = !DILocation(line: 84, column: 1, scope: !104)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!155 = !DILocalVariable(name: "data", scope: !154, file: !12, line: 89, type: !17)
!156 = !DILocation(line: 89, column: 15, scope: !154)
!157 = !DILocalVariable(name: "dataBadBuffer", scope: !154, file: !12, line: 90, type: !25)
!158 = !DILocation(line: 90, column: 13, scope: !154)
!159 = !DILocalVariable(name: "dataGoodBuffer", scope: !154, file: !12, line: 91, type: !30)
!160 = !DILocation(line: 91, column: 13, scope: !154)
!161 = !DILocation(line: 92, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !154, file: !12, line: 92, column: 8)
!163 = !DILocation(line: 92, column: 8, scope: !154)
!164 = !DILocation(line: 95, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 93, column: 5)
!166 = !DILocation(line: 95, column: 14, scope: !165)
!167 = !DILocation(line: 96, column: 9, scope: !165)
!168 = !DILocation(line: 96, column: 17, scope: !165)
!169 = !DILocation(line: 97, column: 5, scope: !165)
!170 = !DILocalVariable(name: "i", scope: !171, file: !12, line: 99, type: !45)
!171 = distinct !DILexicalBlock(scope: !154, file: !12, line: 98, column: 5)
!172 = !DILocation(line: 99, column: 16, scope: !171)
!173 = !DILocalVariable(name: "source", scope: !171, file: !12, line: 100, type: !30)
!174 = !DILocation(line: 100, column: 17, scope: !171)
!175 = !DILocation(line: 101, column: 17, scope: !171)
!176 = !DILocation(line: 101, column: 9, scope: !171)
!177 = !DILocation(line: 102, column: 9, scope: !171)
!178 = !DILocation(line: 102, column: 23, scope: !171)
!179 = !DILocation(line: 104, column: 16, scope: !180)
!180 = distinct !DILexicalBlock(scope: !171, file: !12, line: 104, column: 9)
!181 = !DILocation(line: 104, column: 14, scope: !180)
!182 = !DILocation(line: 104, column: 21, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !12, line: 104, column: 9)
!184 = !DILocation(line: 104, column: 23, scope: !183)
!185 = !DILocation(line: 104, column: 9, scope: !180)
!186 = !DILocation(line: 106, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !12, line: 105, column: 9)
!188 = !DILocation(line: 106, column: 23, scope: !187)
!189 = !DILocation(line: 106, column: 13, scope: !187)
!190 = !DILocation(line: 106, column: 18, scope: !187)
!191 = !DILocation(line: 106, column: 21, scope: !187)
!192 = !DILocation(line: 107, column: 9, scope: !187)
!193 = !DILocation(line: 104, column: 31, scope: !183)
!194 = !DILocation(line: 104, column: 9, scope: !183)
!195 = distinct !{!195, !185, !196, !74}
!196 = !DILocation(line: 107, column: 9, scope: !180)
!197 = !DILocation(line: 108, column: 9, scope: !171)
!198 = !DILocation(line: 108, column: 21, scope: !171)
!199 = !DILocation(line: 109, column: 20, scope: !171)
!200 = !DILocation(line: 109, column: 9, scope: !171)
!201 = !DILocation(line: 111, column: 1, scope: !154)
