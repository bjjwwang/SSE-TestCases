; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %i, metadata !27, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !34, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %data.addr, align 8, !dbg !36
  %call = call i64 @strlen(i8* noundef %1), !dbg !37
  store i64 %call, i64* %dataLen, align 8, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !42
  %3 = load i64, i64* %dataLen, align 8, !dbg !44
  %cmp = icmp ult i64 %2, %3, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !47
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !47
  %6 = load i8, i8* %arrayidx, align 1, !dbg !47
  %7 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !51
  store i8 %6, i8* %arrayidx1, align 1, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %8, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !59
  store i8 0, i8* %arrayidx2, align 1, !dbg !60
  %9 = load i8*, i8** %data.addr, align 8, !dbg !61
  call void @printLine(i8* noundef %9), !dbg !62
  %10 = load i8*, i8** %data.addr, align 8, !dbg !63
  call void @free(i8* noundef %10), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_bad() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !71
  store i8* %call, i8** %data, align 8, !dbg !72
  %0 = load i8*, i8** %data, align 8, !dbg !73
  %cmp = icmp eq i8* %0, null, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !77
  unreachable, !dbg !77

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !79
  %2 = load i8*, i8** %data, align 8, !dbg !79
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !79
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !79
  %4 = load i8*, i8** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  %5 = load i8*, i8** %data, align 8, !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_badSink(i8* noundef %5), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_goodG2BSink(i8* noundef %data) #0 !dbg !85 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !90
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = load i8*, i8** %data.addr, align 8, !dbg !95
  %call = call i64 @strlen(i8* noundef %1), !dbg !96
  store i64 %call, i64* %dataLen, align 8, !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !101
  %3 = load i64, i64* %dataLen, align 8, !dbg !103
  %cmp = icmp ult i64 %2, %3, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data.addr, align 8, !dbg !106
  %5 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !106
  %6 = load i8, i8* %arrayidx, align 1, !dbg !106
  %7 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %7, !dbg !110
  store i8 %6, i8* %arrayidx1, align 1, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %8, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !117
  store i8 0, i8* %arrayidx2, align 1, !dbg !118
  %9 = load i8*, i8** %data.addr, align 8, !dbg !119
  call void @printLine(i8* noundef %9), !dbg !120
  %10 = load i8*, i8** %data.addr, align 8, !dbg !121
  call void @free(i8* noundef %10), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_good() #0 !dbg !124 {
entry:
  call void @goodG2B(), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !127 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !132, metadata !DIExpression()), !dbg !133
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !134, metadata !DIExpression()), !dbg !135
  %call = call i64 @time(i64* noundef null), !dbg !136
  %conv = trunc i64 %call to i32, !dbg !137
  call void @srand(i32 noundef %conv), !dbg !138
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !139
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_good(), !dbg !140
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !141
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !142
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_bad(), !dbg !143
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !144
  ret i32 0, !dbg !145
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !146 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !147, metadata !DIExpression()), !dbg !148
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !149
  store i8* %call, i8** %data, align 8, !dbg !150
  %0 = load i8*, i8** %data, align 8, !dbg !151
  %cmp = icmp eq i8* %0, null, !dbg !153
  br i1 %cmp, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !157
  %2 = load i8*, i8** %data, align 8, !dbg !157
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !157
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !157
  %4 = load i8*, i8** %data, align 8, !dbg !158
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !158
  store i8 0, i8* %arrayidx, align 1, !dbg !159
  %5 = load i8*, i8** %data, align 8, !dbg !160
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_goodG2BSink(i8* noundef %5), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 78, scope: !14)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !15, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 26, column: 14, scope: !22)
!27 = !DILocalVariable(name: "i", scope: !22, file: !15, line: 27, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !29, line: 31, baseType: !30)
!29 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !31, line: 94, baseType: !32)
!31 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!32 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DILocation(line: 27, column: 16, scope: !22)
!34 = !DILocalVariable(name: "dataLen", scope: !22, file: !15, line: 27, type: !28)
!35 = !DILocation(line: 27, column: 19, scope: !22)
!36 = !DILocation(line: 28, column: 26, scope: !22)
!37 = !DILocation(line: 28, column: 19, scope: !22)
!38 = !DILocation(line: 28, column: 17, scope: !22)
!39 = !DILocation(line: 30, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !22, file: !15, line: 30, column: 9)
!41 = !DILocation(line: 30, column: 14, scope: !40)
!42 = !DILocation(line: 30, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !15, line: 30, column: 9)
!44 = !DILocation(line: 30, column: 25, scope: !43)
!45 = !DILocation(line: 30, column: 23, scope: !43)
!46 = !DILocation(line: 30, column: 9, scope: !40)
!47 = !DILocation(line: 32, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !15, line: 31, column: 9)
!49 = !DILocation(line: 32, column: 28, scope: !48)
!50 = !DILocation(line: 32, column: 18, scope: !48)
!51 = !DILocation(line: 32, column: 13, scope: !48)
!52 = !DILocation(line: 32, column: 21, scope: !48)
!53 = !DILocation(line: 33, column: 9, scope: !48)
!54 = !DILocation(line: 30, column: 35, scope: !43)
!55 = !DILocation(line: 30, column: 9, scope: !43)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 33, column: 9, scope: !40)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 34, column: 9, scope: !22)
!60 = !DILocation(line: 34, column: 20, scope: !22)
!61 = !DILocation(line: 35, column: 19, scope: !22)
!62 = !DILocation(line: 35, column: 9, scope: !22)
!63 = !DILocation(line: 36, column: 14, scope: !22)
!64 = !DILocation(line: 36, column: 9, scope: !22)
!65 = !DILocation(line: 38, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_bad", scope: !15, file: !15, line: 40, type: !67, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 42, type: !3)
!70 = !DILocation(line: 42, column: 12, scope: !66)
!71 = !DILocation(line: 43, column: 20, scope: !66)
!72 = !DILocation(line: 43, column: 10, scope: !66)
!73 = !DILocation(line: 44, column: 9, scope: !74)
!74 = distinct !DILexicalBlock(scope: !66, file: !15, line: 44, column: 9)
!75 = !DILocation(line: 44, column: 14, scope: !74)
!76 = !DILocation(line: 44, column: 9, scope: !66)
!77 = !DILocation(line: 44, column: 24, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !15, line: 44, column: 23)
!79 = !DILocation(line: 46, column: 5, scope: !66)
!80 = !DILocation(line: 47, column: 5, scope: !66)
!81 = !DILocation(line: 47, column: 17, scope: !66)
!82 = !DILocation(line: 48, column: 70, scope: !66)
!83 = !DILocation(line: 48, column: 5, scope: !66)
!84 = !DILocation(line: 49, column: 1, scope: !66)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_goodG2BSink", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!86 = !DILocalVariable(name: "data", arg: 1, scope: !85, file: !15, line: 55, type: !3)
!87 = !DILocation(line: 55, column: 82, scope: !85)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !15, line: 58, type: !23)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 57, column: 5)
!90 = !DILocation(line: 58, column: 14, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !89, file: !15, line: 59, type: !28)
!92 = !DILocation(line: 59, column: 16, scope: !89)
!93 = !DILocalVariable(name: "dataLen", scope: !89, file: !15, line: 59, type: !28)
!94 = !DILocation(line: 59, column: 19, scope: !89)
!95 = !DILocation(line: 60, column: 26, scope: !89)
!96 = !DILocation(line: 60, column: 19, scope: !89)
!97 = !DILocation(line: 60, column: 17, scope: !89)
!98 = !DILocation(line: 62, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !89, file: !15, line: 62, column: 9)
!100 = !DILocation(line: 62, column: 14, scope: !99)
!101 = !DILocation(line: 62, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !15, line: 62, column: 9)
!103 = !DILocation(line: 62, column: 25, scope: !102)
!104 = !DILocation(line: 62, column: 23, scope: !102)
!105 = !DILocation(line: 62, column: 9, scope: !99)
!106 = !DILocation(line: 64, column: 23, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !15, line: 63, column: 9)
!108 = !DILocation(line: 64, column: 28, scope: !107)
!109 = !DILocation(line: 64, column: 18, scope: !107)
!110 = !DILocation(line: 64, column: 13, scope: !107)
!111 = !DILocation(line: 64, column: 21, scope: !107)
!112 = !DILocation(line: 65, column: 9, scope: !107)
!113 = !DILocation(line: 62, column: 35, scope: !102)
!114 = !DILocation(line: 62, column: 9, scope: !102)
!115 = distinct !{!115, !105, !116, !58}
!116 = !DILocation(line: 65, column: 9, scope: !99)
!117 = !DILocation(line: 66, column: 9, scope: !89)
!118 = !DILocation(line: 66, column: 20, scope: !89)
!119 = !DILocation(line: 67, column: 19, scope: !89)
!120 = !DILocation(line: 67, column: 9, scope: !89)
!121 = !DILocation(line: 68, column: 14, scope: !89)
!122 = !DILocation(line: 68, column: 9, scope: !89)
!123 = !DILocation(line: 70, column: 1, scope: !85)
!124 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_41_good", scope: !15, file: !15, line: 84, type: !67, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!125 = !DILocation(line: 86, column: 5, scope: !124)
!126 = !DILocation(line: 87, column: 1, scope: !124)
!127 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !128, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!128 = !DISubroutineType(types: !129)
!129 = !{!130, !130, !131}
!130 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!132 = !DILocalVariable(name: "argc", arg: 1, scope: !127, file: !15, line: 99, type: !130)
!133 = !DILocation(line: 99, column: 14, scope: !127)
!134 = !DILocalVariable(name: "argv", arg: 2, scope: !127, file: !15, line: 99, type: !131)
!135 = !DILocation(line: 99, column: 27, scope: !127)
!136 = !DILocation(line: 102, column: 22, scope: !127)
!137 = !DILocation(line: 102, column: 12, scope: !127)
!138 = !DILocation(line: 102, column: 5, scope: !127)
!139 = !DILocation(line: 104, column: 5, scope: !127)
!140 = !DILocation(line: 105, column: 5, scope: !127)
!141 = !DILocation(line: 106, column: 5, scope: !127)
!142 = !DILocation(line: 109, column: 5, scope: !127)
!143 = !DILocation(line: 110, column: 5, scope: !127)
!144 = !DILocation(line: 111, column: 5, scope: !127)
!145 = !DILocation(line: 113, column: 5, scope: !127)
!146 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 73, type: !67, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!147 = !DILocalVariable(name: "data", scope: !146, file: !15, line: 75, type: !3)
!148 = !DILocation(line: 75, column: 12, scope: !146)
!149 = !DILocation(line: 76, column: 20, scope: !146)
!150 = !DILocation(line: 76, column: 10, scope: !146)
!151 = !DILocation(line: 77, column: 9, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !15, line: 77, column: 9)
!153 = !DILocation(line: 77, column: 14, scope: !152)
!154 = !DILocation(line: 77, column: 9, scope: !146)
!155 = !DILocation(line: 77, column: 24, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !15, line: 77, column: 23)
!157 = !DILocation(line: 79, column: 5, scope: !146)
!158 = !DILocation(line: 80, column: 5, scope: !146)
!159 = !DILocation(line: 80, column: 16, scope: !146)
!160 = !DILocation(line: 81, column: 74, scope: !146)
!161 = !DILocation(line: 81, column: 5, scope: !146)
!162 = !DILocation(line: 82, column: 1, scope: !146)
