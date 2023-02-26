; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !37
  %2 = load i8*, i8** %1, align 8, !dbg !38
  store i8* %2, i8** %data1, align 8, !dbg !36
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !39
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !39
  %call2 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #9, !dbg !39
  %6 = load i8*, i8** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %7 = load i8*, i8** %data1, align 8, !dbg !42
  %8 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %7, i8** %8, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !45, metadata !DIExpression()), !dbg !47
  %9 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %10 = load i8*, i8** %9, align 8, !dbg !49
  store i8* %10, i8** %data3, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %11 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 50, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !63, metadata !DIExpression()), !dbg !64
  %12 = load i8*, i8** %data3, align 8, !dbg !65
  %call4 = call i64 @strlen(i8* noundef %12), !dbg !66
  store i64 %call4, i64* %dataLen, align 8, !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %if.end
  %13 = load i64, i64* %i, align 8, !dbg !71
  %14 = load i64, i64* %dataLen, align 8, !dbg !73
  %cmp5 = icmp ult i64 %13, %14, !dbg !74
  br i1 %cmp5, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %15 = load i8*, i8** %data3, align 8, !dbg !76
  %16 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx6 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !76
  %17 = load i8, i8* %arrayidx6, align 1, !dbg !76
  %18 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %18, !dbg !80
  store i8 %17, i8* %arrayidx7, align 1, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %19, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !88
  store i8 0, i8* %arrayidx8, align 1, !dbg !89
  %20 = load i8*, i8** %data3, align 8, !dbg !90
  call void @printLine(i8* noundef %20), !dbg !91
  %21 = load i8*, i8** %data3, align 8, !dbg !92
  call void @free(i8* noundef %21), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* noundef null), !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 noundef %conv), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_good(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_bad(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !119, metadata !DIExpression()), !dbg !120
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !122
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !123
  store i8* %call, i8** %data, align 8, !dbg !124
  %0 = load i8*, i8** %data, align 8, !dbg !125
  %cmp = icmp eq i8* %0, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !131, metadata !DIExpression()), !dbg !133
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !134
  %2 = load i8*, i8** %1, align 8, !dbg !135
  store i8* %2, i8** %data1, align 8, !dbg !133
  %3 = load i8*, i8** %data1, align 8, !dbg !136
  %4 = load i8*, i8** %data1, align 8, !dbg !136
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !136
  %call2 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #9, !dbg !136
  %6 = load i8*, i8** %data1, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  %7 = load i8*, i8** %data1, align 8, !dbg !139
  %8 = load i8**, i8*** %dataPtr1, align 8, !dbg !140
  store i8* %7, i8** %8, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !142, metadata !DIExpression()), !dbg !144
  %9 = load i8**, i8*** %dataPtr2, align 8, !dbg !145
  %10 = load i8*, i8** %9, align 8, !dbg !146
  store i8* %10, i8** %data3, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !147, metadata !DIExpression()), !dbg !149
  %11 = bitcast [50 x i8]* %dest to i8*, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 50, i1 false), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !152, metadata !DIExpression()), !dbg !153
  %12 = load i8*, i8** %data3, align 8, !dbg !154
  %call4 = call i64 @strlen(i8* noundef %12), !dbg !155
  store i64 %call4, i64* %dataLen, align 8, !dbg !156
  store i64 0, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !159

for.cond:                                         ; preds = %for.inc, %if.end
  %13 = load i64, i64* %i, align 8, !dbg !160
  %14 = load i64, i64* %dataLen, align 8, !dbg !162
  %cmp5 = icmp ult i64 %13, %14, !dbg !163
  br i1 %cmp5, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %15 = load i8*, i8** %data3, align 8, !dbg !165
  %16 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx6 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !165
  %17 = load i8, i8* %arrayidx6, align 1, !dbg !165
  %18 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %18, !dbg !169
  store i8 %17, i8* %arrayidx7, align 1, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %19 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %19, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !176
  store i8 0, i8* %arrayidx8, align 1, !dbg !177
  %20 = load i8*, i8** %data3, align 8, !dbg !178
  call void @printLine(i8* noundef %20), !dbg !179
  %21 = load i8*, i8** %data3, align 8, !dbg !180
  call void @free(i8* noundef %21), !dbg !181
  ret void, !dbg !182
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 26, column: 13, scope: !14)
!24 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 13, scope: !14)
!26 = !DILocation(line: 28, column: 20, scope: !14)
!27 = !DILocation(line: 28, column: 10, scope: !14)
!28 = !DILocation(line: 29, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!30 = !DILocation(line: 29, column: 14, scope: !29)
!31 = !DILocation(line: 29, column: 9, scope: !14)
!32 = !DILocation(line: 29, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 23)
!34 = !DILocalVariable(name: "data", scope: !35, file: !15, line: 31, type: !3)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!36 = !DILocation(line: 31, column: 16, scope: !35)
!37 = !DILocation(line: 31, column: 24, scope: !35)
!38 = !DILocation(line: 31, column: 23, scope: !35)
!39 = !DILocation(line: 33, column: 9, scope: !35)
!40 = !DILocation(line: 34, column: 9, scope: !35)
!41 = !DILocation(line: 34, column: 21, scope: !35)
!42 = !DILocation(line: 35, column: 21, scope: !35)
!43 = !DILocation(line: 35, column: 10, scope: !35)
!44 = !DILocation(line: 35, column: 19, scope: !35)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !3)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 16, scope: !46)
!48 = !DILocation(line: 38, column: 24, scope: !46)
!49 = !DILocation(line: 38, column: 23, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 40, column: 18, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !51, file: !15, line: 41, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 31, baseType: !59)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !60, line: 94, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!61 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 41, column: 20, scope: !51)
!63 = !DILocalVariable(name: "dataLen", scope: !51, file: !15, line: 41, type: !57)
!64 = !DILocation(line: 41, column: 23, scope: !51)
!65 = !DILocation(line: 42, column: 30, scope: !51)
!66 = !DILocation(line: 42, column: 23, scope: !51)
!67 = !DILocation(line: 42, column: 21, scope: !51)
!68 = !DILocation(line: 44, column: 20, scope: !69)
!69 = distinct !DILexicalBlock(scope: !51, file: !15, line: 44, column: 13)
!70 = !DILocation(line: 44, column: 18, scope: !69)
!71 = !DILocation(line: 44, column: 25, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !15, line: 44, column: 13)
!73 = !DILocation(line: 44, column: 29, scope: !72)
!74 = !DILocation(line: 44, column: 27, scope: !72)
!75 = !DILocation(line: 44, column: 13, scope: !69)
!76 = !DILocation(line: 46, column: 27, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !15, line: 45, column: 13)
!78 = !DILocation(line: 46, column: 32, scope: !77)
!79 = !DILocation(line: 46, column: 22, scope: !77)
!80 = !DILocation(line: 46, column: 17, scope: !77)
!81 = !DILocation(line: 46, column: 25, scope: !77)
!82 = !DILocation(line: 47, column: 13, scope: !77)
!83 = !DILocation(line: 44, column: 39, scope: !72)
!84 = !DILocation(line: 44, column: 13, scope: !72)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 47, column: 13, scope: !69)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 48, column: 13, scope: !51)
!89 = !DILocation(line: 48, column: 24, scope: !51)
!90 = !DILocation(line: 49, column: 23, scope: !51)
!91 = !DILocation(line: 49, column: 13, scope: !51)
!92 = !DILocation(line: 50, column: 18, scope: !51)
!93 = !DILocation(line: 50, column: 13, scope: !51)
!94 = !DILocation(line: 53, column: 1, scope: !14)
!95 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_32_good", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DILocation(line: 94, column: 5, scope: !95)
!97 = !DILocation(line: 95, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 106, type: !99, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!99 = !DISubroutineType(types: !100)
!100 = !{!101, !101, !22}
!101 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !15, line: 106, type: !101)
!103 = !DILocation(line: 106, column: 14, scope: !98)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !15, line: 106, type: !22)
!105 = !DILocation(line: 106, column: 27, scope: !98)
!106 = !DILocation(line: 109, column: 22, scope: !98)
!107 = !DILocation(line: 109, column: 12, scope: !98)
!108 = !DILocation(line: 109, column: 5, scope: !98)
!109 = !DILocation(line: 111, column: 5, scope: !98)
!110 = !DILocation(line: 112, column: 5, scope: !98)
!111 = !DILocation(line: 113, column: 5, scope: !98)
!112 = !DILocation(line: 116, column: 5, scope: !98)
!113 = !DILocation(line: 117, column: 5, scope: !98)
!114 = !DILocation(line: 118, column: 5, scope: !98)
!115 = !DILocation(line: 120, column: 5, scope: !98)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!117 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 62, type: !3)
!118 = !DILocation(line: 62, column: 12, scope: !116)
!119 = !DILocalVariable(name: "dataPtr1", scope: !116, file: !15, line: 63, type: !22)
!120 = !DILocation(line: 63, column: 13, scope: !116)
!121 = !DILocalVariable(name: "dataPtr2", scope: !116, file: !15, line: 64, type: !22)
!122 = !DILocation(line: 64, column: 13, scope: !116)
!123 = !DILocation(line: 65, column: 20, scope: !116)
!124 = !DILocation(line: 65, column: 10, scope: !116)
!125 = !DILocation(line: 66, column: 9, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !15, line: 66, column: 9)
!127 = !DILocation(line: 66, column: 14, scope: !126)
!128 = !DILocation(line: 66, column: 9, scope: !116)
!129 = !DILocation(line: 66, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 66, column: 23)
!131 = !DILocalVariable(name: "data", scope: !132, file: !15, line: 68, type: !3)
!132 = distinct !DILexicalBlock(scope: !116, file: !15, line: 67, column: 5)
!133 = !DILocation(line: 68, column: 16, scope: !132)
!134 = !DILocation(line: 68, column: 24, scope: !132)
!135 = !DILocation(line: 68, column: 23, scope: !132)
!136 = !DILocation(line: 70, column: 9, scope: !132)
!137 = !DILocation(line: 71, column: 9, scope: !132)
!138 = !DILocation(line: 71, column: 20, scope: !132)
!139 = !DILocation(line: 72, column: 21, scope: !132)
!140 = !DILocation(line: 72, column: 10, scope: !132)
!141 = !DILocation(line: 72, column: 19, scope: !132)
!142 = !DILocalVariable(name: "data", scope: !143, file: !15, line: 75, type: !3)
!143 = distinct !DILexicalBlock(scope: !116, file: !15, line: 74, column: 5)
!144 = !DILocation(line: 75, column: 16, scope: !143)
!145 = !DILocation(line: 75, column: 24, scope: !143)
!146 = !DILocation(line: 75, column: 23, scope: !143)
!147 = !DILocalVariable(name: "dest", scope: !148, file: !15, line: 77, type: !52)
!148 = distinct !DILexicalBlock(scope: !143, file: !15, line: 76, column: 9)
!149 = !DILocation(line: 77, column: 18, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !148, file: !15, line: 78, type: !57)
!151 = !DILocation(line: 78, column: 20, scope: !148)
!152 = !DILocalVariable(name: "dataLen", scope: !148, file: !15, line: 78, type: !57)
!153 = !DILocation(line: 78, column: 23, scope: !148)
!154 = !DILocation(line: 79, column: 30, scope: !148)
!155 = !DILocation(line: 79, column: 23, scope: !148)
!156 = !DILocation(line: 79, column: 21, scope: !148)
!157 = !DILocation(line: 81, column: 20, scope: !158)
!158 = distinct !DILexicalBlock(scope: !148, file: !15, line: 81, column: 13)
!159 = !DILocation(line: 81, column: 18, scope: !158)
!160 = !DILocation(line: 81, column: 25, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !15, line: 81, column: 13)
!162 = !DILocation(line: 81, column: 29, scope: !161)
!163 = !DILocation(line: 81, column: 27, scope: !161)
!164 = !DILocation(line: 81, column: 13, scope: !158)
!165 = !DILocation(line: 83, column: 27, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !15, line: 82, column: 13)
!167 = !DILocation(line: 83, column: 32, scope: !166)
!168 = !DILocation(line: 83, column: 22, scope: !166)
!169 = !DILocation(line: 83, column: 17, scope: !166)
!170 = !DILocation(line: 83, column: 25, scope: !166)
!171 = !DILocation(line: 84, column: 13, scope: !166)
!172 = !DILocation(line: 81, column: 39, scope: !161)
!173 = !DILocation(line: 81, column: 13, scope: !161)
!174 = distinct !{!174, !164, !175, !87}
!175 = !DILocation(line: 84, column: 13, scope: !158)
!176 = !DILocation(line: 85, column: 13, scope: !148)
!177 = !DILocation(line: 85, column: 24, scope: !148)
!178 = !DILocation(line: 86, column: 23, scope: !148)
!179 = !DILocation(line: 86, column: 13, scope: !148)
!180 = !DILocation(line: 87, column: 18, scope: !148)
!181 = !DILocation(line: 87, column: 13, scope: !148)
!182 = !DILocation(line: 90, column: 1, scope: !116)
