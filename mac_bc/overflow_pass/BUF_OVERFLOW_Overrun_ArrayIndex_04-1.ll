; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.input = private unnamed_addr constant [5 x i8] c"&x&&\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [12 x i8], align 1
  %input = alloca [5 x i8], align 1
  %dst_index = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [12 x i8]* %buf, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [5 x i8]* %input, metadata !21, metadata !DIExpression()), !dbg !25
  %0 = bitcast [5 x i8]* %input to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([5 x i8], [5 x i8]* @__const.main.input, i32 0, i32 0), i64 5, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %dst_index, metadata !26, metadata !DIExpression()), !dbg !27
  store i32 0, i32* %dst_index, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !32
  %conv = sext i32 %1 to i64, !dbg !32
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %input, i64 0, i64 0, !dbg !34
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !35
  %cmp = icmp ult i64 %conv, %call, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !38
  %idxprom = sext i32 %2 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [5 x i8], [5 x i8]* %input, i64 0, i64 %idxprom, !dbg !41
  %3 = load i8, i8* %arrayidx, align 1, !dbg !41
  %conv2 = sext i8 %3 to i32, !dbg !41
  %cmp3 = icmp eq i32 38, %conv2, !dbg !42
  br i1 %cmp3, label %if.then, label %if.else, !dbg !43

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* %dst_index, align 4, !dbg !44
  %inc = add nsw i32 %4, 1, !dbg !44
  store i32 %inc, i32* %dst_index, align 4, !dbg !44
  %idxprom5 = sext i32 %4 to i64, !dbg !46
  %arrayidx6 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom5, !dbg !46
  store i8 49, i8* %arrayidx6, align 1, !dbg !47
  %5 = load i32, i32* %dst_index, align 4, !dbg !48
  %inc7 = add nsw i32 %5, 1, !dbg !48
  store i32 %inc7, i32* %dst_index, align 4, !dbg !48
  %idxprom8 = sext i32 %5 to i64, !dbg !49
  %arrayidx9 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom8, !dbg !49
  store i8 50, i8* %arrayidx9, align 1, !dbg !50
  %6 = load i32, i32* %dst_index, align 4, !dbg !51
  %inc10 = add nsw i32 %6, 1, !dbg !51
  store i32 %inc10, i32* %dst_index, align 4, !dbg !51
  %idxprom11 = sext i32 %6 to i64, !dbg !52
  %arrayidx12 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom11, !dbg !52
  store i8 51, i8* %arrayidx12, align 1, !dbg !53
  %7 = load i32, i32* %dst_index, align 4, !dbg !54
  %inc13 = add nsw i32 %7, 1, !dbg !54
  store i32 %inc13, i32* %dst_index, align 4, !dbg !54
  %idxprom14 = sext i32 %7 to i64, !dbg !55
  %arrayidx15 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom14, !dbg !55
  store i8 52, i8* %arrayidx15, align 1, !dbg !56
  br label %if.end, !dbg !57

if.else:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !58
  %idxprom16 = sext i32 %8 to i64, !dbg !60
  %arrayidx17 = getelementptr inbounds [5 x i8], [5 x i8]* %input, i64 0, i64 %idxprom16, !dbg !60
  %9 = load i8, i8* %arrayidx17, align 1, !dbg !60
  %10 = load i32, i32* %dst_index, align 4, !dbg !61
  %inc18 = add nsw i32 %10, 1, !dbg !61
  store i32 %inc18, i32* %dst_index, align 4, !dbg !61
  %idxprom19 = sext i32 %10 to i64, !dbg !62
  %arrayidx20 = getelementptr inbounds [12 x i8], [12 x i8]* %buf, i64 0, i64 %idxprom19, !dbg !62
  store i8 %9, i8* %arrayidx20, align 1, !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4, !dbg !65
  %inc21 = add nsw i32 %11, 1, !dbg !65
  store i32 %inc21, i32* %i, align 4, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %12 = load i32, i32* %retval, align 4, !dbg !70
  ret i32 %12, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buf", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 96, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 12)
!20 = !DILocation(line: 8, column: 7, scope: !9)
!21 = !DILocalVariable(name: "input", scope: !9, file: !10, line: 9, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 40, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 5)
!25 = !DILocation(line: 9, column: 7, scope: !9)
!26 = !DILocalVariable(name: "dst_index", scope: !9, file: !10, line: 10, type: !13)
!27 = !DILocation(line: 10, column: 6, scope: !9)
!28 = !DILocalVariable(name: "i", scope: !29, file: !10, line: 11, type: !13)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 2)
!30 = !DILocation(line: 11, column: 11, scope: !29)
!31 = !DILocation(line: 11, column: 7, scope: !29)
!32 = !DILocation(line: 11, column: 18, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 11, column: 2)
!34 = !DILocation(line: 11, column: 29, scope: !33)
!35 = !DILocation(line: 11, column: 22, scope: !33)
!36 = !DILocation(line: 11, column: 20, scope: !33)
!37 = !DILocation(line: 11, column: 2, scope: !29)
!38 = !DILocation(line: 12, column: 19, scope: !39)
!39 = distinct !DILexicalBlock(scope: !40, file: !10, line: 12, column: 6)
!40 = distinct !DILexicalBlock(scope: !33, file: !10, line: 11, column: 41)
!41 = !DILocation(line: 12, column: 13, scope: !39)
!42 = !DILocation(line: 12, column: 10, scope: !39)
!43 = !DILocation(line: 12, column: 6, scope: !40)
!44 = !DILocation(line: 13, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !10, line: 12, column: 23)
!46 = !DILocation(line: 13, column: 4, scope: !45)
!47 = !DILocation(line: 13, column: 21, scope: !45)
!48 = !DILocation(line: 14, column: 17, scope: !45)
!49 = !DILocation(line: 14, column: 4, scope: !45)
!50 = !DILocation(line: 14, column: 21, scope: !45)
!51 = !DILocation(line: 15, column: 17, scope: !45)
!52 = !DILocation(line: 15, column: 4, scope: !45)
!53 = !DILocation(line: 15, column: 21, scope: !45)
!54 = !DILocation(line: 16, column: 17, scope: !45)
!55 = !DILocation(line: 16, column: 4, scope: !45)
!56 = !DILocation(line: 16, column: 21, scope: !45)
!57 = !DILocation(line: 17, column: 3, scope: !45)
!58 = !DILocation(line: 19, column: 29, scope: !59)
!59 = distinct !DILexicalBlock(scope: !39, file: !10, line: 18, column: 8)
!60 = !DILocation(line: 19, column: 23, scope: !59)
!61 = !DILocation(line: 19, column: 17, scope: !59)
!62 = !DILocation(line: 19, column: 4, scope: !59)
!63 = !DILocation(line: 19, column: 21, scope: !59)
!64 = !DILocation(line: 21, column: 2, scope: !40)
!65 = !DILocation(line: 11, column: 38, scope: !33)
!66 = !DILocation(line: 11, column: 2, scope: !33)
!67 = distinct !{!67, !37, !68, !69}
!68 = !DILocation(line: 21, column: 2, scope: !29)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 22, column: 1, scope: !9)
