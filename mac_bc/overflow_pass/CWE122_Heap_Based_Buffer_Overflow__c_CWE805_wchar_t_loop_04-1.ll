; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx2, align 4, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !58
  %cmp3 = icmp ult i64 %3, 100, !dbg !60
  br i1 %cmp3, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !64
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !64
  %6 = load i32*, i32** %data, align 8, !dbg !65
  %7 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !65
  store i32 %5, i32* %arrayidx5, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %8, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !74
  store i32 0, i32* %arrayidx6, align 4, !dbg !75
  %10 = load i32*, i32** %data, align 8, !dbg !76
  call void @printWLine(i32* noundef %10), !dbg !77
  %11 = load i32*, i32** %data, align 8, !dbg !78
  %12 = bitcast i32* %11 to i8*, !dbg !78
  call void @free(i8* noundef %12), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !109
  %0 = bitcast i8* %call to i32*, !dbg !112
  store i32* %0, i32** %data, align 8, !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  %cmp = icmp eq i32* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !127
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !128
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !129
  store i32 0, i32* %arrayidx2, align 4, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !134
  %cmp3 = icmp ult i64 %3, 100, !dbg !136
  br i1 %cmp3, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !140
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !140
  %6 = load i32*, i32** %data, align 8, !dbg !141
  %7 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !141
  store i32 %5, i32* %arrayidx5, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %8, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !149
  store i32 0, i32* %arrayidx6, align 4, !dbg !150
  %10 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* noundef %10), !dbg !152
  %11 = load i32*, i32** %data, align 8, !dbg !153
  %12 = bitcast i32* %11 to i8*, !dbg !153
  call void @free(i8* noundef %12), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  store i32* null, i32** %data, align 8, !dbg !159
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !160
  %0 = bitcast i8* %call to i32*, !dbg !163
  store i32* %0, i32** %data, align 8, !dbg !164
  %1 = load i32*, i32** %data, align 8, !dbg !165
  %cmp = icmp eq i32* %1, null, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !178
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !179
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !180
  store i32 0, i32* %arrayidx2, align 4, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !185
  %cmp3 = icmp ult i64 %3, 100, !dbg !187
  br i1 %cmp3, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !191
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !191
  %6 = load i32*, i32** %data, align 8, !dbg !192
  %7 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !192
  store i32 %5, i32* %arrayidx5, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %8, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !200
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !200
  store i32 0, i32* %arrayidx6, align 4, !dbg !201
  %10 = load i32*, i32** %data, align 8, !dbg !202
  call void @printWLine(i32* noundef %10), !dbg !203
  %11 = load i32*, i32** %data, align 8, !dbg !204
  %12 = bitcast i32* %11 to i8*, !dbg !204
  call void @free(i8* noundef %12), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04_bad", scope: !19, file: !19, line: 30, type: !20, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 15, scope: !18)
!25 = !DILocation(line: 33, column: 10, scope: !18)
!26 = !DILocation(line: 37, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 35, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 8)
!29 = !DILocation(line: 37, column: 16, scope: !27)
!30 = !DILocation(line: 37, column: 14, scope: !27)
!31 = !DILocation(line: 38, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !19, line: 38, column: 13)
!33 = !DILocation(line: 38, column: 18, scope: !32)
!34 = !DILocation(line: 38, column: 13, scope: !27)
!35 = !DILocation(line: 38, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 38, column: 27)
!37 = !DILocation(line: 39, column: 9, scope: !27)
!38 = !DILocation(line: 39, column: 17, scope: !27)
!39 = !DILocalVariable(name: "i", scope: !40, file: !19, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 31, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !44)
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 42, column: 16, scope: !40)
!46 = !DILocalVariable(name: "source", scope: !40, file: !19, line: 43, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 43, column: 17, scope: !40)
!51 = !DILocation(line: 44, column: 17, scope: !40)
!52 = !DILocation(line: 44, column: 9, scope: !40)
!53 = !DILocation(line: 45, column: 9, scope: !40)
!54 = !DILocation(line: 45, column: 23, scope: !40)
!55 = !DILocation(line: 47, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !19, line: 47, column: 9)
!57 = !DILocation(line: 47, column: 14, scope: !56)
!58 = !DILocation(line: 47, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !19, line: 47, column: 9)
!60 = !DILocation(line: 47, column: 23, scope: !59)
!61 = !DILocation(line: 47, column: 9, scope: !56)
!62 = !DILocation(line: 49, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !19, line: 48, column: 9)
!64 = !DILocation(line: 49, column: 23, scope: !63)
!65 = !DILocation(line: 49, column: 13, scope: !63)
!66 = !DILocation(line: 49, column: 18, scope: !63)
!67 = !DILocation(line: 49, column: 21, scope: !63)
!68 = !DILocation(line: 50, column: 9, scope: !63)
!69 = !DILocation(line: 47, column: 31, scope: !59)
!70 = !DILocation(line: 47, column: 9, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 50, column: 9, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 51, column: 9, scope: !40)
!75 = !DILocation(line: 51, column: 21, scope: !40)
!76 = !DILocation(line: 52, column: 20, scope: !40)
!77 = !DILocation(line: 52, column: 9, scope: !40)
!78 = !DILocation(line: 53, column: 14, scope: !40)
!79 = !DILocation(line: 53, column: 9, scope: !40)
!80 = !DILocation(line: 55, column: 1, scope: !18)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_04_good", scope: !19, file: !19, line: 122, type: !20, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DILocation(line: 124, column: 5, scope: !81)
!83 = !DILocation(line: 125, column: 5, scope: !81)
!84 = !DILocation(line: 126, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 138, type: !86, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!86 = !DISubroutineType(types: !87)
!87 = !{!8, !8, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !19, line: 138, type: !8)
!92 = !DILocation(line: 138, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !19, line: 138, type: !88)
!94 = !DILocation(line: 138, column: 27, scope: !85)
!95 = !DILocation(line: 141, column: 22, scope: !85)
!96 = !DILocation(line: 141, column: 12, scope: !85)
!97 = !DILocation(line: 141, column: 5, scope: !85)
!98 = !DILocation(line: 143, column: 5, scope: !85)
!99 = !DILocation(line: 144, column: 5, scope: !85)
!100 = !DILocation(line: 145, column: 5, scope: !85)
!101 = !DILocation(line: 148, column: 5, scope: !85)
!102 = !DILocation(line: 149, column: 5, scope: !85)
!103 = !DILocation(line: 150, column: 5, scope: !85)
!104 = !DILocation(line: 152, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!106 = !DILocalVariable(name: "data", scope: !105, file: !19, line: 64, type: !3)
!107 = !DILocation(line: 64, column: 15, scope: !105)
!108 = !DILocation(line: 65, column: 10, scope: !105)
!109 = !DILocation(line: 74, column: 27, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !19, line: 72, column: 5)
!111 = distinct !DILexicalBlock(scope: !105, file: !19, line: 66, column: 8)
!112 = !DILocation(line: 74, column: 16, scope: !110)
!113 = !DILocation(line: 74, column: 14, scope: !110)
!114 = !DILocation(line: 75, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !110, file: !19, line: 75, column: 13)
!116 = !DILocation(line: 75, column: 18, scope: !115)
!117 = !DILocation(line: 75, column: 13, scope: !110)
!118 = !DILocation(line: 75, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !19, line: 75, column: 27)
!120 = !DILocation(line: 76, column: 9, scope: !110)
!121 = !DILocation(line: 76, column: 17, scope: !110)
!122 = !DILocalVariable(name: "i", scope: !123, file: !19, line: 79, type: !41)
!123 = distinct !DILexicalBlock(scope: !105, file: !19, line: 78, column: 5)
!124 = !DILocation(line: 79, column: 16, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !123, file: !19, line: 80, type: !47)
!126 = !DILocation(line: 80, column: 17, scope: !123)
!127 = !DILocation(line: 81, column: 17, scope: !123)
!128 = !DILocation(line: 81, column: 9, scope: !123)
!129 = !DILocation(line: 82, column: 9, scope: !123)
!130 = !DILocation(line: 82, column: 23, scope: !123)
!131 = !DILocation(line: 84, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !19, line: 84, column: 9)
!133 = !DILocation(line: 84, column: 14, scope: !132)
!134 = !DILocation(line: 84, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !19, line: 84, column: 9)
!136 = !DILocation(line: 84, column: 23, scope: !135)
!137 = !DILocation(line: 84, column: 9, scope: !132)
!138 = !DILocation(line: 86, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !19, line: 85, column: 9)
!140 = !DILocation(line: 86, column: 23, scope: !139)
!141 = !DILocation(line: 86, column: 13, scope: !139)
!142 = !DILocation(line: 86, column: 18, scope: !139)
!143 = !DILocation(line: 86, column: 21, scope: !139)
!144 = !DILocation(line: 87, column: 9, scope: !139)
!145 = !DILocation(line: 84, column: 31, scope: !135)
!146 = !DILocation(line: 84, column: 9, scope: !135)
!147 = distinct !{!147, !137, !148, !73}
!148 = !DILocation(line: 87, column: 9, scope: !132)
!149 = !DILocation(line: 88, column: 9, scope: !123)
!150 = !DILocation(line: 88, column: 21, scope: !123)
!151 = !DILocation(line: 89, column: 20, scope: !123)
!152 = !DILocation(line: 89, column: 9, scope: !123)
!153 = !DILocation(line: 90, column: 14, scope: !123)
!154 = !DILocation(line: 90, column: 9, scope: !123)
!155 = !DILocation(line: 92, column: 1, scope: !105)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 95, type: !20, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!157 = !DILocalVariable(name: "data", scope: !156, file: !19, line: 97, type: !3)
!158 = !DILocation(line: 97, column: 15, scope: !156)
!159 = !DILocation(line: 98, column: 10, scope: !156)
!160 = !DILocation(line: 102, column: 27, scope: !161)
!161 = distinct !DILexicalBlock(scope: !162, file: !19, line: 100, column: 5)
!162 = distinct !DILexicalBlock(scope: !156, file: !19, line: 99, column: 8)
!163 = !DILocation(line: 102, column: 16, scope: !161)
!164 = !DILocation(line: 102, column: 14, scope: !161)
!165 = !DILocation(line: 103, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !19, line: 103, column: 13)
!167 = !DILocation(line: 103, column: 18, scope: !166)
!168 = !DILocation(line: 103, column: 13, scope: !161)
!169 = !DILocation(line: 103, column: 28, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !19, line: 103, column: 27)
!171 = !DILocation(line: 104, column: 9, scope: !161)
!172 = !DILocation(line: 104, column: 17, scope: !161)
!173 = !DILocalVariable(name: "i", scope: !174, file: !19, line: 107, type: !41)
!174 = distinct !DILexicalBlock(scope: !156, file: !19, line: 106, column: 5)
!175 = !DILocation(line: 107, column: 16, scope: !174)
!176 = !DILocalVariable(name: "source", scope: !174, file: !19, line: 108, type: !47)
!177 = !DILocation(line: 108, column: 17, scope: !174)
!178 = !DILocation(line: 109, column: 17, scope: !174)
!179 = !DILocation(line: 109, column: 9, scope: !174)
!180 = !DILocation(line: 110, column: 9, scope: !174)
!181 = !DILocation(line: 110, column: 23, scope: !174)
!182 = !DILocation(line: 112, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !174, file: !19, line: 112, column: 9)
!184 = !DILocation(line: 112, column: 14, scope: !183)
!185 = !DILocation(line: 112, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !19, line: 112, column: 9)
!187 = !DILocation(line: 112, column: 23, scope: !186)
!188 = !DILocation(line: 112, column: 9, scope: !183)
!189 = !DILocation(line: 114, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !19, line: 113, column: 9)
!191 = !DILocation(line: 114, column: 23, scope: !190)
!192 = !DILocation(line: 114, column: 13, scope: !190)
!193 = !DILocation(line: 114, column: 18, scope: !190)
!194 = !DILocation(line: 114, column: 21, scope: !190)
!195 = !DILocation(line: 115, column: 9, scope: !190)
!196 = !DILocation(line: 112, column: 31, scope: !186)
!197 = !DILocation(line: 112, column: 9, scope: !186)
!198 = distinct !{!198, !188, !199, !73}
!199 = !DILocation(line: 115, column: 9, scope: !183)
!200 = !DILocation(line: 116, column: 9, scope: !174)
!201 = !DILocation(line: 116, column: 21, scope: !174)
!202 = !DILocation(line: 117, column: 20, scope: !174)
!203 = !DILocation(line: 117, column: 9, scope: !174)
!204 = !DILocation(line: 118, column: 14, scope: !174)
!205 = !DILocation(line: 118, column: 9, scope: !174)
!206 = !DILocation(line: 120, column: 1, scope: !156)
