; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %call1 = call i8* @badSource(i8* noundef %1), !dbg !30
  store i8* %call1, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %call2 = call i64 @strlen(i8* noundef %3), !dbg !48
  store i64 %call2, i64* %dataLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !53
  %5 = load i64, i64* %dataLen, align 8, !dbg !55
  %cmp3 = icmp ult i64 %4, %5, !dbg !56
  br i1 %cmp3, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !58
  %8 = load i8, i8* %arrayidx, align 1, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !62
  store i8 %8, i8* %arrayidx4, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %10, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !70
  store i8 0, i8* %arrayidx5, align 1, !dbg !71
  %11 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* noundef %11), !dbg !73
  %12 = load i8*, i8** %data, align 8, !dbg !74
  call void @free(i8* noundef %12), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @badSource(i8* noundef %data) #0 !dbg !77 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i8*, i8** %data.addr, align 8, !dbg !82
  %1 = load i8*, i8** %data.addr, align 8, !dbg !82
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !82
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #9, !dbg !82
  %3 = load i8*, i8** %data.addr, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  %4 = load i8*, i8** %data.addr, align 8, !dbg !85
  ret i8* %4, !dbg !86
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i64 @strlen(i8* noundef) #5

declare void @printLine(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !112
  store i8* %call, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !120
  %call1 = call i8* @goodG2BSource(i8* noundef %1), !dbg !121
  store i8* %call1, i8** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !128, metadata !DIExpression()), !dbg !129
  %3 = load i8*, i8** %data, align 8, !dbg !130
  %call2 = call i64 @strlen(i8* noundef %3), !dbg !131
  store i64 %call2, i64* %dataLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !136
  %5 = load i64, i64* %dataLen, align 8, !dbg !138
  %cmp3 = icmp ult i64 %4, %5, !dbg !139
  br i1 %cmp3, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !141
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !141
  %8 = load i8, i8* %arrayidx, align 1, !dbg !141
  %9 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %9, !dbg !145
  store i8 %8, i8* %arrayidx4, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %10, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !152
  store i8 0, i8* %arrayidx5, align 1, !dbg !153
  %11 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* noundef %11), !dbg !155
  %12 = load i8*, i8** %data, align 8, !dbg !156
  call void @free(i8* noundef %12), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2BSource(i8* noundef %data) #0 !dbg !159 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = load i8*, i8** %data.addr, align 8, !dbg !162
  %1 = load i8*, i8** %data.addr, align 8, !dbg !162
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !162
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #9, !dbg !162
  %3 = load i8*, i8** %data.addr, align 8, !dbg !163
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !163
  store i8 0, i8* %arrayidx, align 1, !dbg !164
  %4 = load i8*, i8** %data.addr, align 8, !dbg !165
  ret i8* %4, !dbg !166
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_bad", scope: !15, file: !15, line: 31, type: !16, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 33, type: !3)
!20 = !DILocation(line: 33, column: 12, scope: !14)
!21 = !DILocation(line: 34, column: 20, scope: !14)
!22 = !DILocation(line: 34, column: 10, scope: !14)
!23 = !DILocation(line: 35, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 9)
!25 = !DILocation(line: 35, column: 14, scope: !24)
!26 = !DILocation(line: 35, column: 9, scope: !14)
!27 = !DILocation(line: 35, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 35, column: 23)
!29 = !DILocation(line: 36, column: 22, scope: !14)
!30 = !DILocation(line: 36, column: 12, scope: !14)
!31 = !DILocation(line: 36, column: 10, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 38, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 38, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 39, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 31, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !42, line: 94, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!43 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 39, column: 16, scope: !33)
!45 = !DILocalVariable(name: "dataLen", scope: !33, file: !15, line: 39, type: !39)
!46 = !DILocation(line: 39, column: 19, scope: !33)
!47 = !DILocation(line: 40, column: 26, scope: !33)
!48 = !DILocation(line: 40, column: 19, scope: !33)
!49 = !DILocation(line: 40, column: 17, scope: !33)
!50 = !DILocation(line: 42, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !33, file: !15, line: 42, column: 9)
!52 = !DILocation(line: 42, column: 14, scope: !51)
!53 = !DILocation(line: 42, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 42, column: 9)
!55 = !DILocation(line: 42, column: 25, scope: !54)
!56 = !DILocation(line: 42, column: 23, scope: !54)
!57 = !DILocation(line: 42, column: 9, scope: !51)
!58 = !DILocation(line: 44, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !15, line: 43, column: 9)
!60 = !DILocation(line: 44, column: 28, scope: !59)
!61 = !DILocation(line: 44, column: 18, scope: !59)
!62 = !DILocation(line: 44, column: 13, scope: !59)
!63 = !DILocation(line: 44, column: 21, scope: !59)
!64 = !DILocation(line: 45, column: 9, scope: !59)
!65 = !DILocation(line: 42, column: 35, scope: !54)
!66 = !DILocation(line: 42, column: 9, scope: !54)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 45, column: 9, scope: !51)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 46, column: 9, scope: !33)
!71 = !DILocation(line: 46, column: 20, scope: !33)
!72 = !DILocation(line: 47, column: 19, scope: !33)
!73 = !DILocation(line: 47, column: 9, scope: !33)
!74 = !DILocation(line: 48, column: 14, scope: !33)
!75 = !DILocation(line: 48, column: 9, scope: !33)
!76 = !DILocation(line: 50, column: 1, scope: !14)
!77 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !78, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!78 = !DISubroutineType(types: !79)
!79 = !{!3, !3}
!80 = !DILocalVariable(name: "data", arg: 1, scope: !77, file: !15, line: 23, type: !3)
!81 = !DILocation(line: 23, column: 32, scope: !77)
!82 = !DILocation(line: 26, column: 5, scope: !77)
!83 = !DILocation(line: 27, column: 5, scope: !77)
!84 = !DILocation(line: 27, column: 17, scope: !77)
!85 = !DILocation(line: 28, column: 12, scope: !77)
!86 = !DILocation(line: 28, column: 5, scope: !77)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_42_good", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!88 = !DILocation(line: 88, column: 5, scope: !87)
!89 = !DILocation(line: 89, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 101, type: !91, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !94}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !15, line: 101, type: !93)
!96 = !DILocation(line: 101, column: 14, scope: !90)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !15, line: 101, type: !94)
!98 = !DILocation(line: 101, column: 27, scope: !90)
!99 = !DILocation(line: 104, column: 22, scope: !90)
!100 = !DILocation(line: 104, column: 12, scope: !90)
!101 = !DILocation(line: 104, column: 5, scope: !90)
!102 = !DILocation(line: 106, column: 5, scope: !90)
!103 = !DILocation(line: 107, column: 5, scope: !90)
!104 = !DILocation(line: 108, column: 5, scope: !90)
!105 = !DILocation(line: 111, column: 5, scope: !90)
!106 = !DILocation(line: 112, column: 5, scope: !90)
!107 = !DILocation(line: 113, column: 5, scope: !90)
!108 = !DILocation(line: 115, column: 5, scope: !90)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 67, type: !3)
!111 = !DILocation(line: 67, column: 12, scope: !109)
!112 = !DILocation(line: 68, column: 20, scope: !109)
!113 = !DILocation(line: 68, column: 10, scope: !109)
!114 = !DILocation(line: 69, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !15, line: 69, column: 9)
!116 = !DILocation(line: 69, column: 14, scope: !115)
!117 = !DILocation(line: 69, column: 9, scope: !109)
!118 = !DILocation(line: 69, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 69, column: 23)
!120 = !DILocation(line: 70, column: 26, scope: !109)
!121 = !DILocation(line: 70, column: 12, scope: !109)
!122 = !DILocation(line: 70, column: 10, scope: !109)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !15, line: 72, type: !34)
!124 = distinct !DILexicalBlock(scope: !109, file: !15, line: 71, column: 5)
!125 = !DILocation(line: 72, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !15, line: 73, type: !39)
!127 = !DILocation(line: 73, column: 16, scope: !124)
!128 = !DILocalVariable(name: "dataLen", scope: !124, file: !15, line: 73, type: !39)
!129 = !DILocation(line: 73, column: 19, scope: !124)
!130 = !DILocation(line: 74, column: 26, scope: !124)
!131 = !DILocation(line: 74, column: 19, scope: !124)
!132 = !DILocation(line: 74, column: 17, scope: !124)
!133 = !DILocation(line: 76, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !15, line: 76, column: 9)
!135 = !DILocation(line: 76, column: 14, scope: !134)
!136 = !DILocation(line: 76, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !15, line: 76, column: 9)
!138 = !DILocation(line: 76, column: 25, scope: !137)
!139 = !DILocation(line: 76, column: 23, scope: !137)
!140 = !DILocation(line: 76, column: 9, scope: !134)
!141 = !DILocation(line: 78, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !15, line: 77, column: 9)
!143 = !DILocation(line: 78, column: 28, scope: !142)
!144 = !DILocation(line: 78, column: 18, scope: !142)
!145 = !DILocation(line: 78, column: 13, scope: !142)
!146 = !DILocation(line: 78, column: 21, scope: !142)
!147 = !DILocation(line: 79, column: 9, scope: !142)
!148 = !DILocation(line: 76, column: 35, scope: !137)
!149 = !DILocation(line: 76, column: 9, scope: !137)
!150 = distinct !{!150, !140, !151, !69}
!151 = !DILocation(line: 79, column: 9, scope: !134)
!152 = !DILocation(line: 80, column: 9, scope: !124)
!153 = !DILocation(line: 80, column: 20, scope: !124)
!154 = !DILocation(line: 81, column: 19, scope: !124)
!155 = !DILocation(line: 81, column: 9, scope: !124)
!156 = !DILocation(line: 82, column: 14, scope: !124)
!157 = !DILocation(line: 82, column: 9, scope: !124)
!158 = !DILocation(line: 84, column: 1, scope: !109)
!159 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 56, type: !78, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!160 = !DILocalVariable(name: "data", arg: 1, scope: !159, file: !15, line: 56, type: !3)
!161 = !DILocation(line: 56, column: 36, scope: !159)
!162 = !DILocation(line: 59, column: 5, scope: !159)
!163 = !DILocation(line: 60, column: 5, scope: !159)
!164 = !DILocation(line: 60, column: 16, scope: !159)
!165 = !DILocation(line: 61, column: 12, scope: !159)
!166 = !DILocation(line: 61, column: 5, scope: !159)
