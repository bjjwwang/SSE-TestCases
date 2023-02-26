; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 10) #6, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call1 = call i64 @strlen(i8* noundef %arraydecay), !dbg !48
  store i64 %call1, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !53
  %3 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %3, 1, !dbg !56
  %cmp2 = icmp ult i64 %2, %add, !dbg !57
  br i1 %cmp2, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !61
  %5 = load i8, i8* %arrayidx, align 1, !dbg !61
  %6 = load i8*, i8** %data, align 8, !dbg !62
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !62
  store i8 %5, i8* %arrayidx3, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %8, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* noundef %9), !dbg !72
  %10 = load i8*, i8** %data, align 8, !dbg !73
  call void @free(i8* noundef %10), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare i64 @strlen(i8* noundef) #5

declare void @printLine(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_good() #0 !dbg !76 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i8* null, i8** %data, align 8, !dbg !102
  %call = call i8* @malloc(i64 noundef 11) #6, !dbg !103
  store i8* %call, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %cmp = icmp eq i8* %0, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !120
  %call1 = call i64 @strlen(i8* noundef %arraydecay), !dbg !121
  store i64 %call1, i64* %sourceLen, align 8, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !126
  %3 = load i64, i64* %sourceLen, align 8, !dbg !128
  %add = add i64 %3, 1, !dbg !129
  %cmp2 = icmp ult i64 %2, %add, !dbg !130
  br i1 %cmp2, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !134
  %5 = load i8, i8* %arrayidx, align 1, !dbg !134
  %6 = load i8*, i8** %data, align 8, !dbg !135
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !135
  store i8 %5, i8* %arrayidx3, align 1, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %8, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !143
  call void @printLine(i8* noundef %9), !dbg !144
  %10 = load i8*, i8** %data, align 8, !dbg !145
  call void @free(i8* noundef %10), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !149, metadata !DIExpression()), !dbg !150
  store i8* null, i8** %data, align 8, !dbg !151
  %call = call i8* @malloc(i64 noundef 11) #6, !dbg !152
  store i8* %call, i8** %data, align 8, !dbg !155
  %0 = load i8*, i8** %data, align 8, !dbg !156
  %cmp = icmp eq i8* %0, null, !dbg !158
  br i1 %cmp, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !160
  unreachable, !dbg !160

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !162, metadata !DIExpression()), !dbg !164
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !164
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !169
  %call1 = call i64 @strlen(i8* noundef %arraydecay), !dbg !170
  store i64 %call1, i64* %sourceLen, align 8, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !175
  %3 = load i64, i64* %sourceLen, align 8, !dbg !177
  %add = add i64 %3, 1, !dbg !178
  %cmp2 = icmp ult i64 %2, %add, !dbg !179
  br i1 %cmp2, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !183
  %5 = load i8, i8* %arrayidx, align 1, !dbg !183
  %6 = load i8*, i8** %data, align 8, !dbg !184
  %7 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !184
  store i8 %5, i8* %arrayidx3, align 1, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %8, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !192
  call void @printLine(i8* noundef %9), !dbg !193
  %10 = load i8*, i8** %data, align 8, !dbg !194
  call void @free(i8* noundef %10), !dbg !195
  ret void, !dbg !196
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !3)
!20 = !DILocation(line: 30, column: 12, scope: !14)
!21 = !DILocation(line: 31, column: 10, scope: !14)
!22 = !DILocation(line: 35, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 33, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!25 = !DILocation(line: 35, column: 14, scope: !23)
!26 = !DILocation(line: 36, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 36, column: 13)
!28 = !DILocation(line: 36, column: 18, scope: !27)
!29 = !DILocation(line: 36, column: 13, scope: !23)
!30 = !DILocation(line: 36, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 36, column: 27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 39, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 39, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 40, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 31, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !42, line: 94, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 40, column: 16, scope: !33)
!45 = !DILocalVariable(name: "sourceLen", scope: !33, file: !15, line: 40, type: !39)
!46 = !DILocation(line: 40, column: 19, scope: !33)
!47 = !DILocation(line: 41, column: 28, scope: !33)
!48 = !DILocation(line: 41, column: 21, scope: !33)
!49 = !DILocation(line: 41, column: 19, scope: !33)
!50 = !DILocation(line: 44, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !33, file: !15, line: 44, column: 9)
!52 = !DILocation(line: 44, column: 14, scope: !51)
!53 = !DILocation(line: 44, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 44, column: 9)
!55 = !DILocation(line: 44, column: 25, scope: !54)
!56 = !DILocation(line: 44, column: 35, scope: !54)
!57 = !DILocation(line: 44, column: 23, scope: !54)
!58 = !DILocation(line: 44, column: 9, scope: !51)
!59 = !DILocation(line: 46, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !15, line: 45, column: 9)
!61 = !DILocation(line: 46, column: 23, scope: !60)
!62 = !DILocation(line: 46, column: 13, scope: !60)
!63 = !DILocation(line: 46, column: 18, scope: !60)
!64 = !DILocation(line: 46, column: 21, scope: !60)
!65 = !DILocation(line: 47, column: 9, scope: !60)
!66 = !DILocation(line: 44, column: 41, scope: !54)
!67 = !DILocation(line: 44, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 47, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 48, column: 19, scope: !33)
!72 = !DILocation(line: 48, column: 9, scope: !33)
!73 = !DILocation(line: 49, column: 14, scope: !33)
!74 = !DILocation(line: 49, column: 9, scope: !33)
!75 = !DILocation(line: 51, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_03_good", scope: !15, file: !15, line: 114, type: !16, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!77 = !DILocation(line: 116, column: 5, scope: !76)
!78 = !DILocation(line: 117, column: 5, scope: !76)
!79 = !DILocation(line: 118, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 130, type: !81, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 130, type: !83)
!86 = !DILocation(line: 130, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 130, type: !84)
!88 = !DILocation(line: 130, column: 27, scope: !80)
!89 = !DILocation(line: 133, column: 22, scope: !80)
!90 = !DILocation(line: 133, column: 12, scope: !80)
!91 = !DILocation(line: 133, column: 5, scope: !80)
!92 = !DILocation(line: 135, column: 5, scope: !80)
!93 = !DILocation(line: 136, column: 5, scope: !80)
!94 = !DILocation(line: 137, column: 5, scope: !80)
!95 = !DILocation(line: 140, column: 5, scope: !80)
!96 = !DILocation(line: 141, column: 5, scope: !80)
!97 = !DILocation(line: 142, column: 5, scope: !80)
!98 = !DILocation(line: 144, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !16, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 60, type: !3)
!101 = !DILocation(line: 60, column: 12, scope: !99)
!102 = !DILocation(line: 61, column: 10, scope: !99)
!103 = !DILocation(line: 70, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !15, line: 68, column: 5)
!105 = distinct !DILexicalBlock(scope: !99, file: !15, line: 62, column: 8)
!106 = !DILocation(line: 70, column: 14, scope: !104)
!107 = !DILocation(line: 71, column: 13, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 71, column: 13)
!109 = !DILocation(line: 71, column: 18, scope: !108)
!110 = !DILocation(line: 71, column: 13, scope: !104)
!111 = !DILocation(line: 71, column: 28, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 71, column: 27)
!113 = !DILocalVariable(name: "source", scope: !114, file: !15, line: 74, type: !34)
!114 = distinct !DILexicalBlock(scope: !99, file: !15, line: 73, column: 5)
!115 = !DILocation(line: 74, column: 14, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 75, type: !39)
!117 = !DILocation(line: 75, column: 16, scope: !114)
!118 = !DILocalVariable(name: "sourceLen", scope: !114, file: !15, line: 75, type: !39)
!119 = !DILocation(line: 75, column: 19, scope: !114)
!120 = !DILocation(line: 76, column: 28, scope: !114)
!121 = !DILocation(line: 76, column: 21, scope: !114)
!122 = !DILocation(line: 76, column: 19, scope: !114)
!123 = !DILocation(line: 79, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !15, line: 79, column: 9)
!125 = !DILocation(line: 79, column: 14, scope: !124)
!126 = !DILocation(line: 79, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 79, column: 9)
!128 = !DILocation(line: 79, column: 25, scope: !127)
!129 = !DILocation(line: 79, column: 35, scope: !127)
!130 = !DILocation(line: 79, column: 23, scope: !127)
!131 = !DILocation(line: 79, column: 9, scope: !124)
!132 = !DILocation(line: 81, column: 30, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !15, line: 80, column: 9)
!134 = !DILocation(line: 81, column: 23, scope: !133)
!135 = !DILocation(line: 81, column: 13, scope: !133)
!136 = !DILocation(line: 81, column: 18, scope: !133)
!137 = !DILocation(line: 81, column: 21, scope: !133)
!138 = !DILocation(line: 82, column: 9, scope: !133)
!139 = !DILocation(line: 79, column: 41, scope: !127)
!140 = !DILocation(line: 79, column: 9, scope: !127)
!141 = distinct !{!141, !131, !142, !70}
!142 = !DILocation(line: 82, column: 9, scope: !124)
!143 = !DILocation(line: 83, column: 19, scope: !114)
!144 = !DILocation(line: 83, column: 9, scope: !114)
!145 = !DILocation(line: 84, column: 14, scope: !114)
!146 = !DILocation(line: 84, column: 9, scope: !114)
!147 = !DILocation(line: 86, column: 1, scope: !99)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 89, type: !16, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!149 = !DILocalVariable(name: "data", scope: !148, file: !15, line: 91, type: !3)
!150 = !DILocation(line: 91, column: 12, scope: !148)
!151 = !DILocation(line: 92, column: 10, scope: !148)
!152 = !DILocation(line: 96, column: 24, scope: !153)
!153 = distinct !DILexicalBlock(scope: !154, file: !15, line: 94, column: 5)
!154 = distinct !DILexicalBlock(scope: !148, file: !15, line: 93, column: 8)
!155 = !DILocation(line: 96, column: 14, scope: !153)
!156 = !DILocation(line: 97, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 97, column: 13)
!158 = !DILocation(line: 97, column: 18, scope: !157)
!159 = !DILocation(line: 97, column: 13, scope: !153)
!160 = !DILocation(line: 97, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !15, line: 97, column: 27)
!162 = !DILocalVariable(name: "source", scope: !163, file: !15, line: 100, type: !34)
!163 = distinct !DILexicalBlock(scope: !148, file: !15, line: 99, column: 5)
!164 = !DILocation(line: 100, column: 14, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !163, file: !15, line: 101, type: !39)
!166 = !DILocation(line: 101, column: 16, scope: !163)
!167 = !DILocalVariable(name: "sourceLen", scope: !163, file: !15, line: 101, type: !39)
!168 = !DILocation(line: 101, column: 19, scope: !163)
!169 = !DILocation(line: 102, column: 28, scope: !163)
!170 = !DILocation(line: 102, column: 21, scope: !163)
!171 = !DILocation(line: 102, column: 19, scope: !163)
!172 = !DILocation(line: 105, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !163, file: !15, line: 105, column: 9)
!174 = !DILocation(line: 105, column: 14, scope: !173)
!175 = !DILocation(line: 105, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !15, line: 105, column: 9)
!177 = !DILocation(line: 105, column: 25, scope: !176)
!178 = !DILocation(line: 105, column: 35, scope: !176)
!179 = !DILocation(line: 105, column: 23, scope: !176)
!180 = !DILocation(line: 105, column: 9, scope: !173)
!181 = !DILocation(line: 107, column: 30, scope: !182)
!182 = distinct !DILexicalBlock(scope: !176, file: !15, line: 106, column: 9)
!183 = !DILocation(line: 107, column: 23, scope: !182)
!184 = !DILocation(line: 107, column: 13, scope: !182)
!185 = !DILocation(line: 107, column: 18, scope: !182)
!186 = !DILocation(line: 107, column: 21, scope: !182)
!187 = !DILocation(line: 108, column: 9, scope: !182)
!188 = !DILocation(line: 105, column: 41, scope: !176)
!189 = !DILocation(line: 105, column: 9, scope: !176)
!190 = distinct !{!190, !180, !191, !70}
!191 = !DILocation(line: 108, column: 9, scope: !173)
!192 = !DILocation(line: 109, column: 19, scope: !163)
!193 = !DILocation(line: 109, column: 9, scope: !163)
!194 = !DILocation(line: 110, column: 14, scope: !163)
!195 = !DILocation(line: 110, column: 9, scope: !163)
!196 = !DILocation(line: 112, column: 1, scope: !148)
